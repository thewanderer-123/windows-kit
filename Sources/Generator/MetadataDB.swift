import Foundation
import SystemPackage
import BinaryParsing

/// Manages the binary data of a metadata file and information needed to parse
/// table rows. Lightweight view structs representing table rows are parsed on
/// demand, and hold a reference to this class for indices into other tables.
/// This allows them to make the index private and provide computed properties
/// that parse the linked table row when it is accessed.
///
/// View structs go in the Tables folder
class MetadataDB {
	private let data: Data
	let ranges: MetadataRanges

	init(at path: FilePath) throws {
		data = try File(at: path).readAll()
		ranges = try data.withParserSpan { try parseWinMD(&$0) }
	}

	func withTableSpan<T>(for kind: TableKind, rowIndex: Int, _ body: (inout ParserSpan) throws -> T) throws -> T {
		try data.withParserSpan { span in
			guard let range = ranges.tables[kind.rawValue] else {
				throw ParsingError()
			}
			try span.seek(toRange: range)
			try span.seek(toRelativeOffset: ranges.strides[kind.rawValue] * rowIndex)
			return try body(&span)
		}
	}
}

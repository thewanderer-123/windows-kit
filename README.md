# Windows Kit

The goal of this project is to develop bindings to Windows APIs for the
[Swift](https://swift.org/) programming language.

To be able to call Windows APIs from Swift, we need to speak their ABI
(Application Binary Interface) which defines how compiled programs can talk to
each other. There are 3 main ABIs used on Windows:

1.  The C programming language ABI, used by the low-level Win32 API

2.  COM (Component Object Model), which adds object-oriented constructs on top
    of the C ABI

3.  WinRT (Windows Runtime), which is based on COM but adds additional metadata
    to enable automatic generation of safe, idiomatic bindings

We are starting with WinRT, which provides access to the most modern Windows
APIs like [WinUI
3](https://learn.microsoft.com/en-us/windows/apps/winui/winui3/). WinRT APIs are
described in
[WinMD](https://learn.microsoft.com/en-us/uwp/winrt-cref/winmd-files) (Windows
Metadata) files, which are encoded in a binary format called CLI metadata.

This format is specified by
[ECMA-335](https://ecma-international.org/wp-content/uploads/ECMA-335_6th_edition_june_2012.pdf),
which we will be following to develop a parser for CLI metadata and interpret
WinMD files. When this is complete, we will be able to develop a [code
generator](https://www.ibm.com/think/topics/code-generator) for Swift code that
calls WinRT APIs. The code that it generates will be distributed as a library
that anyone can use to develop Windows apps using Swift.

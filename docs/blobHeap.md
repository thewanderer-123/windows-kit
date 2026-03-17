#Blob (Blob heap) is a continuous stream of bytes which represent signatures

signatures are the type info for a function or class

any func should have type info of each parameter + return type of the function
any class should have type info of the fields + property + local variables
which would be contained in a signature

These signatures can be: (ECMA-335 page 283)
- MethodRefSig
- MethodDefSig
- FieldSig
- PropertySig
- localVarSig
- TypeSpec
- MethodSpec

The first byte of the blob represents what the signature is
either being a method or field or property

signatures are compressed before being stored in the blob heap
There are two ways of compressing a signature
- Unsigned integers
- signed integers
- a null string (stored as 0xFF)
(the specifications are at ECMA-335 page 283-284)


// RUN: %dxc -T lib_6_8 -ast-dump-implicit %s | FileCheck %s
// This test verifies the AST of the GroupNodeOutputRecords and
// ThreadNodeOutputRecords types. The source doesn't matter except
// that it forces a use to ensure the AST is fully loaded by the
// external sema source.

struct RECORD
{
  int X;
};


[Shader("node")]
[NumThreads(1024,1,1)]
[NodeLaunch("Broadcasting")]
void node02(NodeOutput<RECORD> output)
{
  GroupNodeOutputRecords<RECORD> outrec = output.GetGroupNodeOutputRecords(1);
}

//CHECK: ClassTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit GroupNodeOutputRecords
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXRecordDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit struct GroupNodeOutputRecords definition
//CHECK-NEXT: FinalAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit final
//CHECK-NEXT: FieldDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit h 'int'
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'const recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'recordType &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int' cinit
//CHECK-NEXT: IntegerLiteral {{0x[0-9a-fA-F]+}} <<invalid sloc>> 'unsigned int' 0
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray"
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'const recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int' cinit
//CHECK-NEXT: IntegerLiteral {{0x[0-9a-fA-F]+}} <<invalid sloc>> 'unsigned int' 0
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray"
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[]
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> index 'unsigned int'
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class TResult
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit OutputComplete 'TResult () const'
//CHECK-NEXT: ClassTemplateSpecializationDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> struct GroupNodeOutputRecords definition
//CHECK-NEXT: TemplateArgument type 'RECORD'
//CHECK-NEXT: FinalAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit final
//CHECK-NEXT: FieldDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit h 'int'
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'RECORD &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'const RECORD &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'RECORD &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'const RECORD &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[]
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> index 'unsigned int'
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class TResult
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete 'TResult () const'
//CHECK-NEXT: CXXDestructorDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit referenced ~GroupNodeOutputRecords 'void () noexcept' inline

[Shader("node")]
[NumThreads(1024,1,1)]
[NodeLaunch("Broadcasting")]
void node03(NodeOutput<RECORD> output)
{
  ThreadNodeOutputRecords<RECORD> outrec = output.GetThreadNodeOutputRecords(1);
}

//CHECK: ClassTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit ThreadNodeOutputRecords
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXRecordDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit struct ThreadNodeOutputRecords definition
//CHECK-NEXT: FinalAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit final
//CHECK-NEXT: FieldDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit h 'int'
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'const recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'recordType &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int' cinit
//CHECK-NEXT: IntegerLiteral {{0x[0-9a-fA-F]+}} <<invalid sloc>> 'unsigned int' 0
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray"
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'const recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int' cinit
//CHECK-NEXT: IntegerLiteral {{0x[0-9a-fA-F]+}} <<invalid sloc>> 'unsigned int' 0
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray"
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[]
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> index 'unsigned int'
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class TResult
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit OutputComplete 'TResult () const'
//CHECK-NEXT: ClassTemplateSpecializationDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> struct ThreadNodeOutputRecords definition
//CHECK-NEXT: TemplateArgument type 'RECORD'
//CHECK-NEXT: FinalAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit final
//CHECK-NEXT: FieldDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit h 'int'
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'RECORD &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'const RECORD &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'RECORD &(unsigned int)'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Get 'const RECORD &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> Index 'unsigned int'
//CHECK-NEXT: HLSLIntrinsicAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit "op" "ExtractRecordStructFromArray" 18
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[]
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class recordType
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> operator[] 'recordType &(unsigned int) const'
//CHECK-NEXT: ParmVarDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> index 'unsigned int'
//CHECK-NEXT: HLSLCXXOverloadAttr {{0x[0-9a-fA-F]+}} <<invalid sloc>> Implicit
//CHECK-NEXT: FunctionTemplateDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete
//CHECK-NEXT: TemplateTypeParmDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> class TResult
//CHECK-NEXT: CXXMethodDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> OutputComplete 'TResult () const'
//CHECK-NEXT: CXXDestructorDecl {{0x[0-9a-fA-F]+}} <<invalid sloc>> <invalid sloc> implicit referenced ~ThreadNodeOutputRecords 'void () noexcept' inline

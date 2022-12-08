@ocaml.doc("* Wrap TS values to be used from Reason")

// Basic Type Literals ************************************************************
@genType.import("./TypeRepertoire")
external integerValue: int = "integerValue"
@genType.import("./TypeRepertoire")
external integerValueFromVar: int = "integerValueFromVar"
@genType.import("./TypeRepertoire")
external floatValue: float = "floatValue"
@genType.import("./TypeRepertoire")
external binaryValue: int = "binaryValue"
@genType.import("./TypeRepertoire")
external calValue: int = "calValue"
@genType.import("./TypeRepertoire")
external calValue2: int = "calValue2"
@genType.import("./TypeRepertoire")
external calValue3: int = "calValue3"

@genType.import("./TypeRepertoire")
external booleanValue: bool = "booleanValue"
@genType.import("./TypeRepertoire")
external booleanValue2: bool = "booleanValue2"
@genType.import("./TypeRepertoire")
external booleanValue3: bool = "booleanValue3"
@genType.import("./TypeRepertoire")
external booleanValue4: int = "booleanValue4"

@genType.import("./TypeRepertoire")
external stringValue: string = "stringValue"

// Basic Structure Literals ************************************************************
// list
@genType.import("./TypeRepertoire")
external integerList: array<int>  = "integerList"

@genType.import("./TypeRepertoire")
external integerList2: array<int>  = "integerList2"

@genType.import("./TypeRepertoire")
external integerList3: array<int>  = "integerList3"

// tuple
@genType.import("./TypeRepertoire")
type numberOrString

@genType.import("./TypeRepertoire")
// external intstrTuple: (int, string) = "intstrTuple" // error
external intstrTuple: (array<numberOrString>) = "intstrTuple"
@genType.import("./TypeRepertoire")
external intstrTuple2: (int, string)  = "intstrTuple2"

// enum
@genType.import("./TypeRepertoire")
type colorEnum

@genType.import("./TypeRepertoire")
external enumValue: float  = "enumValue" // enum value type : int, float

// objects
type pointRequired_rescript = {
  x: int,
  y: int,
}

type pointOptional_rescript = {
  x: int,
  y?: int,
}

@genType.import("./TypeRepertoire")
external objectSimple: pointRequired_rescript  = "objectSimple"

type deepdeep = {
  object1 : pointRequired_rescript
}

type deep = {
  deepdeep : deepdeep
}

type objectComplexT = {
  object : pointRequired_rescript,
  deep : deep,
}

@genType.import("./TypeRepertoire")
external objectComplex: objectComplexT  = "objectComplex"

// functions
@genType.import("./TypeRepertoire")
external funcInt2Int: int => int = "funcInt2Int"

@genType let funcInt2IntRet = funcInt2Int(5)

@genType.import("./TypeRepertoire")
external funcStr2Array: string => array<int> = "funcStr2Array"

// @genType.import("./TypeRepertoire")
// external funcPoint2Point: pointRequired_rescript => pointRequired_rescript = "funcPoint2Point"

@genType.import("./TypeRepertoire")
external funcPoint2PointExact: pointOptional_rescript => pointRequired_rescript = "funcPoint2Point"

// union types
@genType.import("./TypeRepertoire")
type numberOrStringOrNull

@genType.import("./TypeRepertoire")
type complexUnion

@genType.import("./TypeRepertoire")
external intORstrORnull : numberOrStringOrNull = "intORstrORnull"

@genType.import("./TypeRepertoire")
external unions : complexUnion = "unions"


// original MyMath ************************************************************
@genType.import("./TypeRepertoire")
external returnMixedArray: unit => array<numberOrString> = "returnMixedArray"

module AbsoluteValue = {
  @genType.import(("./TypeRepertoire", "AbsoluteValue"))
  type t = {"getAbs": (. unit) => int}

  /* This is untyped */
  @send external getProp: t => int = "getProp"

  /* This is also untyped, as we "trust" the type declaration in absoluteVaue */
  let getAbs = (x: t) => {
    let getAbs = x["getAbs"]
    getAbs(.)
  }
}

@genType let useGetProp = (x: AbsoluteValue.t) => x->AbsoluteValue.getProp + 1

@genType let useGetAbs = (x: AbsoluteValue.t) => x->AbsoluteValue.getAbs + 1

@genType.import("./TypeRepertoire")
type stringFunction

@genType type color = [#tomato | #gray]

@genType.import("./TypeRepertoire") external useColor: color => int = "useColor"

@genType.import("./TypeRepertoire") external higherOrder: ((int, int) => int) => int = "higherOrder"

@genType let returnedFromHigherOrder = higherOrder(\"+")

type variant =
  | I(int)
  | S(string)

@genType.import("./TypeRepertoire") external convertVariant: variant => variant = "convertVariant"

@genType.import("./TypeRepertoire") external polymorphic: 'a => 'a = "polymorphic"

@genType.import("./TypeRepertoire") external default: int = "default"

@genType.import(("./TypeRepertoire", "num"))
type num

@genType.import(("./TypeRepertoire", "num"))
type myNum

@genType.import("./TypeRepertoire")
type polyType<'a>

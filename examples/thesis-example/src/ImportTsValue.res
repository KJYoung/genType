@ocaml.doc("* Wrap TS values to be used from Reason")

// Basic Types from TypeBasics.ts ************************************************************
// Literals
@genType.import("./TypeBasics")
external integerValue: int = "integerValue"
@genType.import("./TypeBasics")
external floatValue: float = "floatValue"
@genType.import("./TypeBasics")
external binaryValue: int = "binaryValue"
@genType.import("./TypeBasics")
external booleanValue: bool = "booleanValue"
@genType.import("./TypeBasics")
external booleanValue2: bool = "booleanValue2"
@genType.import("./TypeBasics")
external booleanValue3: bool = "booleanValue3"
@genType.import("./TypeBasics")
external stringValue: string = "stringValue"

// number => number operations
@genType.import("./TypeBasics")
external opValue1: int = "opValue1"
@genType.import("./TypeBasics")
external opValue2: int = "opValue2"
@genType.import("./TypeBasics")
external opValue3: int = "opValue3"
@genType.import("./TypeBasics")
external opValue4: int = "opValue4"
@genType.import("./TypeBasics")
external opValue5: int = "opValue5"
@genType.import("./TypeBasics")
external opValue6: int = "opValue6"
@genType.import("./TypeBasics")
external opValue7: int = "opValue7"
@genType.import("./TypeBasics")
external opValue8: int = "opValue8"

// number => boolean operations
@genType.import("./TypeBasics")
external opValue11: bool = "opValue11"
@genType.import("./TypeBasics")
external opValue12: bool = "opValue12"

// boolean => boolean operations
@genType.import("./TypeBasics")
external opValue21: bool = "opValue21"
@genType.import("./TypeBasics")
external opValue22: bool = "opValue22"
@genType.import("./TypeBasics")
external opValue23: int = "opValue23"
@genType.import("./TypeBasics")
external opValue24: float = "opValue24"
@genType.import("./TypeBasics")
external opValue25: string = "opValue25"
@genType.import("./TypeBasics")
external opValue27: unknown = "opValue27"

// any => string operations
@genType.import("./TypeBasics")
external opValue31: string = "opValue31"
@genType.import("./TypeBasics")
external opValue32: string = "opValue32"
@genType.import("./TypeBasics")
external opValue33: string = "opValue33"

// variable assignment (number)
@genType.import("./TypeBasics")
external integerValueFromVar: int = "integerValueFromVar"
@genType.import("./TypeBasics")
external integerValueFromVarParen: int = "integerValueFromVarParen"
@genType.import("./TypeBasics")
external typeofInteger: string = "typeofInteger"
@genType.import("./TypeBasics")
external instanceofTest: bool = "instanceofTest"

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

@ocaml.doc("
  * Wrap JS values to be used from Reason
  ")
@genType.import("./TypeRepertoire")
external round: float => float = "round"
@genType.import("./TypeRepertoire")
external integerValue: int = "integerValue"
@genType.import("./TypeRepertoire")
external floatValue: float = "floatValue"
@genType.import("./TypeRepertoire")
external stringValue: string = "stringValue"
// external round: float => string = "round"

@genType
type point = {
  x: int,
  y: int,
}

@genType.import("./TypeRepertoire")
external /* This is the module to import from. */
/* Name and type of the JS value to bind to. */
area: point => int = "area"

@genType.import("./TypeRepertoire")
type numberOrString

@genType.import("./TypeRepertoire")
external returnMixedArray: unit => array<numberOrString> = "returnMixedArray"

@genType let roundedNumber = round(1.8)

@genType let areaValue = area({x: 3, y: 2})

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

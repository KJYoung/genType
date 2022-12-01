// @genType.import(("./exportValues", "default"))
// external exportValues: int = "exportValues"

// @genType.import((
//   "./exportNestedValues",
//   "TopLevelClass.MiddleLevelElements.stuff.InnerStuff.innerStuffContents",
// ))
// external innerStuffContents: {"x": int} = "innerStuffContents"

@genType.custom("./exportValues")
type someType2

@genType.import("./exportValues")
type someType


// Js.log(innerStuffContents)
Js.log("hi2")

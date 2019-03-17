// Generated by BUCKLESCRIPT VERSION 5.0.0-dev.5, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as TypesGen from "./Types.gen";
import * as Belt_Option from "bs-platform/lib/es6/belt_Option.js";
import * as SomeFlowTypes from "./SomeFlowTypes";

function consumeOption(x) {
  return Belt_Option.mapWithDefault(x, 0, (function (n) {
                return n;
              }));
}

function consumeOption2(x) {
  return Belt_Option.mapWithDefault(x, 0, (function (n) {
                return n;
              }));
}

function testArray(a) {
  return a;
}

function identity(x) {
  return x;
}

function isWeekend(day) {
  if (day === SomeFlowTypes.SATURDAY) {
    return true;
  } else {
    return day === SomeFlowTypes.SUNDAY;
  }
}

function testFunctionOnOptionsAsArgument(a, foo) {
  return Curry._1(foo, a);
}

function foo(prim) {
  return TypesGen.foo(prim);
}

function testDateKey(x) {
  return x;
}

function testAutoAnnotateVariants(x) {
  return x;
}

function testAutoAnnotateVariants2(x) {
  return x;
}

function convertObjectWithCallback(x) {
  return x;
}

export {
  consumeOption ,
  consumeOption2 ,
  testArray ,
  identity ,
  isWeekend ,
  testFunctionOnOptionsAsArgument ,
  foo ,
  testDateKey ,
  testAutoAnnotateVariants ,
  testAutoAnnotateVariants2 ,
  convertObjectWithCallback ,
  
}
/* ./Types.gen Not a pure module */

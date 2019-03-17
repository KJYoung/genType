// Generated by BUCKLESCRIPT VERSION 5.0.0-dev.5, PLEASE EDIT WITH CARE

import * as List from "bs-platform/lib/es6/list.js";
import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as ReasonReact from "reason-react/src/ReasonReact.js";

var component = ReasonReact.statelessComponent("Page");

function handleClick(_event, _self) {
  console.log("clicked!");
  return /* () */0;
}

function make($staropt$star, _children) {
  var message = $staropt$star !== undefined ? $staropt$star : "default message";
  return /* record */[
          /* debugName */component[/* debugName */0],
          /* reactClassInternal */component[/* reactClassInternal */1],
          /* handedOffState */component[/* handedOffState */2],
          /* willReceiveProps */component[/* willReceiveProps */3],
          /* didMount */component[/* didMount */4],
          /* didUpdate */component[/* didUpdate */5],
          /* willUnmount */component[/* willUnmount */6],
          /* willUpdate */component[/* willUpdate */7],
          /* shouldUpdate */component[/* shouldUpdate */8],
          /* render */(function (self) {
              return React.createElement("div", {
                          onClick: Curry._1(self[/* handle */0], handleClick)
                        }, message);
            }),
          /* initialState */component[/* initialState */10],
          /* retainedProps */component[/* retainedProps */11],
          /* reducer */component[/* reducer */12],
          /* jsElementWrapped */component[/* jsElementWrapped */13]
        ];
}

function plus(x, _y) {
  return x + 1 | 0;
}

function concat(x, y) {
  if (y !== undefined) {
    return x + y;
  }
  
}

function consumeVariant(x) {
  if (typeof x === "number") {
    return 1;
  } else if (x.tag) {
    var n = x[0];
    return (
            n !== undefined ? n : 0
          ) + 3 | 0;
  } else {
    return (x[0] + x[1] | 0) + 2 | 0;
  }
}

var l = /* :: */[
  1,
  /* :: */[
    2,
    /* :: */[
      3,
      /* [] */0
    ]
  ]
];

var map = List.map;

export {
  component ,
  handleClick ,
  make ,
  plus ,
  concat ,
  consumeVariant ,
  l ,
  map ,
  
}
/* component Not a pure module */

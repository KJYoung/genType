// Generated by BUCKLESCRIPT VERSION 4.0.1, PLEASE EDIT WITH CARE
'use strict';

var MyBanner = require("./MyBanner");
var ReasonReact = require("reason-react/src/ReasonReact.js");

function make(show, message, children) {
  return ReasonReact.wrapJsForReason(MyBanner, {
              show: show,
              message: message
            }, children);
}

exports.make = make;
/* ./MyBanner Not a pure module */

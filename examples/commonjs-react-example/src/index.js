/* @flow strict */

// flowlint untyped-import:off
const ReactDOM = require("react-dom");
const React = require("react");

const Hooks = require("./Hooks.gen").default;
const ImportValues = require("./ImportValues.gen");

const consoleLog = console.log;

const App = () => (
  <div>
    <Hooks vehicle={{ name: "Car" }}/>
    <br />
    <br />
    <br />
    <br />
    <div>Index.js is here.</div>
  </div>
);
App.displayName = "ExampleInteropRoot";

// $FlowExpectedError[untyped-import]: Reason checked type sufficiently
ReactDOM.render(React.createElement(App), document.getElementById("index"));

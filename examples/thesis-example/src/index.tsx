import * as React from "react";
import * as ReactDOM from "react-dom";
import App from "./App";
import * as ImportJsValue from "./ImportTsValue.gen";
import * as TypeRepertoire from "./TypeRepertoire";

// tslint:disable-next-line:no-console
const consoleLog = console.log;

consoleLog("index.tsx funcInt2IntRet:", ImportJsValue.funcInt2IntRet);
consoleLog(
  "index.tsx returnedFromHigherOrder:",
  ImportJsValue.returnedFromHigherOrder
);


ReactDOM.render(
  <div>
    <App name={"Hello"} />
    <span>Thesis!</span>
  </div>,
  document.getElementById("root") as HTMLElement
);

const absoluteValueInstance = new TypeRepertoire.AbsoluteValue();
absoluteValueInstance.prop = -3;
consoleLog("absoluteValueInstance", absoluteValueInstance);

const propValue = ImportJsValue.useGetProp(absoluteValueInstance);
const absValue = ImportJsValue.useGetAbs(absoluteValueInstance);
consoleLog("ImportJsValue: getProp() =", propValue);
consoleLog("ImportJsValue: getAbs() =", absValue);

type Props = {
  readonly method?: "push" | "replace";
};
export const make: React.FC<Props> = (x: Props) => {
  return <div></div>;
};

export default make;

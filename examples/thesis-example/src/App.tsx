import * as React from "react";

// tslint:disable-next-line:interface-name
export interface Props {
  name: string;
  count?: number;
}

class App extends React.PureComponent<Props> {
  public render() {
    return (
      <div className="App" />
    );
  }
}

export default App;

import React, { Component } from "react";
import { Header, Sidebar } from "./components";

export default class App extends Component {
  render() {
    return (
      <div className="App">
        <Sidebar />
        <Header />
      </div>
    );
  }
}

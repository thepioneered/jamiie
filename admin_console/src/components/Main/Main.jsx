import React, { Component } from "react";
import { Dashboard } from "./components/";
import "./Main.css";

export default class Main extends Component {
  render() {
    return (
      <div className="Main">
        <Dashboard isSidebarOpen={this.props.isSidebarOpen} />
      </div>
    );
  }
}

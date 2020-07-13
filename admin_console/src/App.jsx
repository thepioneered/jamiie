import React, { Component } from "react";
import { Header, Sidebar, Main } from "./components";

export default class App extends Component {
  constructor() {
    super();

    this.state = {
      sidebar_open: true,
    };
  }

  toggleSidebar = () => {
    this.setState({
      sidebar_open: !this.state.sidebar_open,
    });
  };

  render() {
    return (
      <div className="App">
        <Sidebar sidebar_open={this.state.sidebar_open} />
        <Header toggleSidebar={this.toggleSidebar} />
        <Main />
      </div>
    );
  }
}

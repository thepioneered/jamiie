import React, { Component } from "react";
import { Header, Sidebar, Main } from "./components";

export default class App extends Component {
  constructor() {
    super();

    this.state = {
      sidebar_open: true,
      index: [
        { name: "Dashboard", icon: "dashboard", active: true },
        { name: "Transactions", icon: "timeline", active: false },
        { name: "Groups", icon: "group", active: false },
        { name: "Users", icon: "person_outline", active: false },
      ],
    };
  }

  toggleSidebar = () => {
    this.setState({
      sidebar_open: !this.state.sidebar_open,
    });
  };

  render() {
    const activeIndex = this.state.index.filter((item) => item.active);

    return (
      <div className="App">
        <Sidebar
          sidebar_open={this.state.sidebar_open}
          index={this.state.index}
        />
        <Header toggleSidebar={this.toggleSidebar} />
        <Main activeIndex={activeIndex[0]} />
      </div>
    );
  }
}

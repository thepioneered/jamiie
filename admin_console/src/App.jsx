import React, { Component } from "react";
import { Header, Sidebar, Main, Login } from "./components";

export default class App extends Component {
  constructor() {
    super();

    this.state = {
      isLoggedIn: false,
      isSidebarOpen: true,
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
      isSidebarOpen: !this.state.isSidebarOpen,
    });
  };

  changePage = (pageName) => {
    this.setState((prevState) => {
      const updateIndex = prevState.index.map((item) => {
        if (item.active) item.active = !item.active;
        if (item.name === pageName) item.active = !item.active;
        return item;
      });
      return updateIndex;
    });
  };

  render() {
    const activeIndex = this.state.index.filter((item) => item.active);

    if (this.state.isLoggedIn) {
      return (
        <div className="App">
          <Sidebar
            isSidebarOpen={this.state.isSidebarOpen}
            index={this.state.index}
            changePage={this.changePage}
          />
          <Header toggleSidebar={this.toggleSidebar} />
          <Main
            activeIndex={activeIndex[0]}
            isSidebarOpen={this.state.isSidebarOpen}
          />
        </div>
      );
    } else {
      return (
        <div className="app-login">
          <Login />
        </div>
      );
    }
  }
}

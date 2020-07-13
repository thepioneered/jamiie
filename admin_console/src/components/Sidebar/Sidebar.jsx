import React, { Component } from "react";
import "./Sidebar.css";
import logo from "../../Only Logo.svg";

export default class Sidebar extends Component {
  constructor() {
    super();

    this.state = {
      index: [
        { name: "Dashboard", icon: "dashboard", active: true },
        { name: "Transactions", icon: "timeline", active: false },
        { name: "Groups", icon: "group", active: false },
        { name: "Users", icon: "person_outline", active: false },
      ],
    };
  }

  sendList = () => {
    return this.state.index.map((item) => {
      let li_class = "";

      if (item.active) li_class += "active ";
      if (!this.props.sidebar_open) li_class += "li-close";

      return (
        <li key={item.name} className={li_class}>
          <div
            className={
              this.props.sidebar_open
                ? "index-icon"
                : "index-icon index-icon-close"
            }
          >
            <span className="material-icons">{item.icon}</span>
          </div>
          {this.props.sidebar_open ? (
            <div className="index-text">{item.name}</div>
          ) : null}
        </li>
      );
    });
  };

  render() {
    return (
      <div
        className={
          this.props.sidebar_open ? "Sidebar" : "Sidebar Sidebar-close"
        }
      >
        <div className="logo-wrapper">
          <img
            src={logo}
            className={this.props.sidebar_open ? "logo" : "logo-close"}
            alt="logo"
          />
        </div>
        <ul className="index">{this.sendList()}</ul>
      </div>
    );
  }
}

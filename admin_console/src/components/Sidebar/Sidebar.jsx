import React, { Component } from "react";
import "./Sidebar.css";
import logo from "../../images/NewLogo.svg";
import { Link } from "react-router-dom";

export default class Sidebar extends Component {
  sendList = () => {
    return this.props.index.map((item) => {
      let li_class = "not-active ";

      if (item.active) li_class = "active ";
      if (!this.props.isSidebarOpen) li_class += "li-close";

      return (
        <li
          key={item.name}
          className={li_class}
          onClick={() => this.props.changePage(item.name)}
        >
          <Link to={`/dashboard/${item.name}`}>
            <div
              className={
                this.props.isSidebarOpen
                  ? "index-icon"
                  : "index-icon index-icon-close"
              }
            >
              <span className="material-icons">{item.icon}</span>
            </div>

            {this.props.isSidebarOpen ? (
              <div className="index-text">{item.name}</div>
            ) : null}
          </Link>
        </li>
      );
    });
  };

  render() {
    return (
      <div
        className={
          this.props.isSidebarOpen ? "Sidebar" : "Sidebar Sidebar-close"
        }
      >
        <div className="logo-wrapper">
          <img
            src={logo}
            className={this.props.isSidebarOpen ? "logo" : "logo-close"}
            alt="logo"
          />
        </div>
        <ul className="index">{this.sendList()}</ul>
      </div>
    );
  }
}

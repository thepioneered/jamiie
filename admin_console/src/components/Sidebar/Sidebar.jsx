import React, { Component } from "react";
import "./Sidebar.css";
import logo from "../../Only Logo.svg";

export default class Sidebar extends Component {
  render() {
    return (
      <div className="Sidebar">
        <div className="logo-wrapper">
          <img src={logo} className="logo" alt="logo" />
        </div>
        <ul className="index">
          <li className="active">
            <div className="index-icon">
              <span className="material-icons">dashboard</span>
            </div>
            <div className="index-text">Dashboard</div>
          </li>
          <li>
            <div className="index-icon">
              <span className="material-icons">timeline</span>
            </div>
            <div className="index-text">Transactions</div>
          </li>
          <li>
            <div className="index-icon">
              <span className="material-icons">group</span>
            </div>
            <div className="index-text">Users</div>
          </li>
          <li>
            <div className="index-icon">
              <span className="material-icons">person_outline</span>
            </div>
            <div className="index-text">Groups</div>
          </li>
        </ul>
      </div>
    );
  }
}

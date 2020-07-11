import React, { Component } from "react";
import "./Sidebar.css";

export default class Sidebar extends Component {
  render() {
    return (
      <div className="Sidebar">
        <ul>
          <li>Dashboard</li>
          <li>Transactions</li>
          <li>Users</li>
          <li>Groups</li>
        </ul>
      </div>
    );
  }
}

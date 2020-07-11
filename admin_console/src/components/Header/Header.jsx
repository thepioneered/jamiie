import React, { Component } from "react";

export default class Header extends Component {
  render() {
    return (
      <div>
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

import React, { Component } from "react";

export default class Sidebar extends Component {
  render() {
    return (
      <div>
        <div className="hamburger-menu">hamburger</div>
        <div className="searchBar">
          <span>Search</span>
        </div>
        <div className="account-info">
          <div className="name">Paritosh Batish</div>
          <div className="admin">admin</div>
          <div className="avatar">P</div>
        </div>
      </div>
    );
  }
}

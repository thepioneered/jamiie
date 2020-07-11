import React, { Component } from "react";
import "./Header.css";

export default class Header extends Component {
  render() {
    return (
      <div className="Header">
        <div className="hamburger-menu">
          <span className="material-icons">menu</span>
        </div>
        <div className="searchbar">
          <span className="material-icons search-icon">search</span>
          <span className="placeholder-text">Search</span>
        </div>
        <div className="account-info">
          <div className="name">Paritosh Batish</div>
          <div className="admin">Admin</div>
        </div>
        <div className="avatar">P</div>
      </div>
    );
  }
}

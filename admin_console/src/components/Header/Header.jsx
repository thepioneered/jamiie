import React, { Component } from "react";
import "./Header.css";

export default class Header extends Component {
  constructor() {
    super();

    this.state = {
      avatar_menu_open: false,
    };
  }

  toggle_avatar_menu = () => {
    this.setState({
      avatar_menu_open: !this.state.avatar_menu_open,
    });
  };

  check_outstide_click = (event) => {
    console.log(event.target);
  };

  render() {
    return (
      <div className="Header">
        <div className="hamburger-menu">
          <span className="material-icons">menu</span>
        </div>
        <div className="searchbar">
          <input type="text" className="searchbar-input" placeholder="Search" />
          <span className="material-icons search-icon">search</span>
        </div>
        <div className="account-info">
          <div className="name">Paritosh Batish</div>
          <div className="admin">Admin</div>
        </div>
        <div className="avatar" onClick={this.toggle_avatar_menu}>
          P
        </div>

        <div
          className={
            this.state.avatar_menu_open
              ? "avatar-menu avatar-menu-active"
              : "avatar-menu"
          }
          onBlur={(event) => this.check_outstide_click(event)}
        >
          <ul>
            <li>Account Info</li>
            <li>Logout</li>
          </ul>
        </div>
      </div>
    );
  }
}

import React, { Component } from "react";
import AvatarMenu from "./AvatarMenu";
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
        {this.state.avatar_menu_open ? (
          <AvatarMenu toggle_avatar_menu={this.toggle_avatar_menu} />
        ) : null}
      </div>
    );
  }
}

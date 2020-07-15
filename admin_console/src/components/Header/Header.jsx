import React, { Component } from "react";
import AvatarMenu from "./AvatarMenu";
import "./Header.css";

export default class Header extends Component {
  constructor() {
    super();

    this.state = {
      avatar_menu_open: false,
      search_focused: false,
    };
  }

  ToggleAvatarMenu = () => {
    this.setState({
      avatar_menu_open: !this.state.avatar_menu_open,
    });
  };

  ToggleSearchHelp = (by) => {
    this.setState({
      search_focused: !this.state.search_focused,
    });
    console.log("ToggleSearchHelp called by", by);
  };

  FilterSearch = (event) => {
    const filter = event.target.value.toUpperCase();
    const a = document.getElementsByTagName("a");
    for (let i = 0; i < a.length; i++) {
      let txtValue = a[i].textContent || a[i].innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        a[i].style.display = "";
      } else {
        a[i].style.display = "none";
      }
    }
  };

  DropdownSelect = (event) => {
    // console.log(event.target.value);
    console.log("DropdownSelect");
  };

  render() {
    return (
      <div className="Header">
        <div className="hamburger-menu" onClick={this.props.toggleSidebar}>
          <span className="material-icons">menu</span>
        </div>
        <div className="searchbar">
          <input
            type="text"
            className="searchbar-input"
            placeholder="Search"
            onFocus={() => this.ToggleSearchHelp("focus")}
            onBlur={() => this.ToggleSearchHelp("blur")}
            onChange={(event) => this.FilterSearch(event)}
          />
          <div
            className="search-content"
            style={{
              display: this.state.search_focused ? null : "none",
            }}
          >
            <a href="#about">About</a>
            <a href="#base">Base</a>
            <a href="#blog">Blog</a>
            <a href="#contact">Contact</a>
            <a href="#custom">Custom</a>
            <a href="#support">Support</a>
            <a href="#tools">Tools</a>
          </div>
          <span className="material-icons search-icon">search</span>
        </div>
        <div className="account-info">
          <div className="name">Paritosh Batish</div>
          <div className="admin">Admin</div>
        </div>
        <div className="avatar" onClick={this.ToggleAvatarMenu}>
          P
        </div>
        {this.state.avatar_menu_open ? (
          <AvatarMenu toggle_avatar_menu={this.ToggleAvatarMenu} />
        ) : null}
      </div>
    );
  }
}

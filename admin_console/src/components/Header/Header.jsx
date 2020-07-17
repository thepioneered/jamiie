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

  toggleAvatarMenu = () => {
    this.setState({
      avatar_menu_open: !this.state.avatar_menu_open,
    });
  };

  addSearchContent = () => {
    this.setState({
      search_focused: !this.state.search_focused,
    });
  };

  removeSearchContent = () => {
    setTimeout(() => {
      this.setState({
        search_focused: !this.state.search_focused,
      });
    }, 200);
  };

  filterSearch = (event) => {
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
            onFocus={() => this.addSearchContent()}
            onBlur={() => this.removeSearchContent()}
            onChange={(event) => this.filterSearch(event)}
          />
          <div
            className="search-content"
            style={{
              display: this.state.search_focused ? null : "none",
            }}
          >
            <a href="#about" className="search-link">
              About
            </a>
            <a href="#base" className="search-link">
              Base
            </a>
            <a href="#blog" className="search-link">
              Blog
            </a>
            <a href="#contact" className="search-link">
              Contact
            </a>
            <a href="#custom" className="search-link">
              Custom
            </a>
            <a href="#support" className="search-link">
              Support
            </a>
            <a href="#tools" className="search-link">
              Tools
            </a>
          </div>
          <span className="material-icons search-icon">search</span>
        </div>
        <div className="account-info">
          <div className="name">Paritosh Batish</div>
          <div className="admin">Admin</div>
        </div>
        <div className="avatar" onClick={this.toggleAvatarMenu}>
          P
        </div>
        {this.state.avatar_menu_open ? (
          <AvatarMenu toggle_avatar_menu={this.toggleAvatarMenu} />
        ) : null}
      </div>
    );
  }
}

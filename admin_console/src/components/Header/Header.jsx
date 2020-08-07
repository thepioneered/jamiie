import React from "react";
import AvatarMenu from "./AvatarMenu";
import "./Header.css";
import { useState } from "react";

// TODO searchUnfocus timeout
export default function Header({ toggleSidebar }) {
  const [avatarMenuState, avatarMenuToggle] = useState(false);
  const [searchFocused, toggleSearchFocused] = useState(false);

  const toggleAvatarMenu = () => {
    avatarMenuToggle((prevState) => !prevState);
  };

  const addSearchContent = () => {
    toggleSearchFocused((prevState) => !prevState);
  };

  const removeSearchContent = () => {
    setTimeout(() => {
      toggleSearchFocused((prevState) => !prevState);
    }, 200);
  };

  const filterSearch = (event) => {
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

  return (
    <div className="Header">
      <div className="hamburger-menu" onClick={toggleSidebar}>
        <span className="material-icons">menu</span>
      </div>
      <div className="searchbar">
        <input
          type="text"
          className="searchbar-input"
          placeholder="Search"
          onFocus={addSearchContent}
          onBlur={removeSearchContent}
          onChange={(event) => filterSearch(event)}
        />
        <div
          className="search-content"
          style={{
            display: searchFocused ? null : "none",
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
      <div className="avatar" onClick={toggleAvatarMenu}>
        P
      </div>
      {avatarMenuState ? (
        <AvatarMenu toggle_avatar_menu={toggleAvatarMenu} />
      ) : null}
    </div>
  );
}

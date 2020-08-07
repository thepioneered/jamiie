<<<<<<< HEAD
import React from "react";
import { useEffect } from "react";
=======
import React, { Component } from "react";
import auth from "../../utils/auth";
import { withRouter } from "react-router-dom";
>>>>>>> 534f83da5a8a8e5f7d7f92f0acdb2d341390d4b8

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu }) {
  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  });

<<<<<<< HEAD
  function handleClickOutside(event) {
    if (event.target.className !== "avatar") toggle_avatar_menu();
=======
  handleClickOutside = (event) => {
    if (event.target.className !== "avatar-menu-button")
      this.props.toggle_avatar_menu();
  };
  render() {
    return (
      <div className="avatar-menu">
        <ul>
          <li>
            <button
              className="avatar-menu-button"
              onClick={(e) => {
                console.log(auth.isLoggedIn());
              }}
            >
              Account Info
            </button>
          </li>
          <li>
            <button
              className="avatar-menu-button"
              onClick={(e) => {
                auth.logout();
                this.props.history.push("/login");
              }}
            >
              Logout
            </button>
          </li>
        </ul>
      </div>
    );
>>>>>>> 534f83da5a8a8e5f7d7f92f0acdb2d341390d4b8
  }

<<<<<<< HEAD
  return (
    <div className="avatar-menu">
      <ul>
        <li>
          <button>Account Info</button>
        </li>
        <li>
          <button>Logout</button>
        </li>
      </ul>
    </div>
  );
}
=======
export default withRouter(AvatarMenu);
>>>>>>> 534f83da5a8a8e5f7d7f92f0acdb2d341390d4b8

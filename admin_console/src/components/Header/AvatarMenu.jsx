import React, { Component } from "react";
import auth from "../../utils/auth";
import { withRouter } from "react-router-dom";

class AvatarMenu extends Component {
  componentDidMount = () => {
    document.addEventListener("mousedown", this.handleClickOutside);
  };

  componentWillUnmount = () => {
    document.removeEventListener("mousedown", this.handleClickOutside);
  };

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
              onClick={async (e) => {
                console.log("uaa");
                const r = await auth.logout();
                console.log(r);
                this.props.history.push("/login");
              }}
            >
              Logout
            </button>
          </li>
        </ul>
      </div>
    );
  }
}

export default withRouter(AvatarMenu);

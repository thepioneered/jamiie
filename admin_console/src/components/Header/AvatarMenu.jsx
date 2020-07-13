import React, { Component } from "react";

class AvatarMenu extends Component {
  componentDidMount = () => {
    document.addEventListener("mousedown", this.handleClickOutside);
  };

  componentWillUnmount = () => {
    document.removeEventListener("mousedown", this.handleClickOutside);
  };

  handleClickOutside = (event) => {
    this.props.toggle_avatar_menu();
  };
  render() {
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
}

export default AvatarMenu;

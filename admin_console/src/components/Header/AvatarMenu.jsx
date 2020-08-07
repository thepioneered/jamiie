import React from "react";
import { useEffect } from "react";

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu }) {
  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  });

  function handleClickOutside(event) {
    if (event.target.className !== "avatar") toggle_avatar_menu();
  }

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

import React from "react";
import { useEffect } from "react";
import styles from "../../styles/header.module.scss";

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
    <div className={styles.avatar__menu}>
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

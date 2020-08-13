import React from "react";
import { useEffect } from "react";
import logoutUser from "../utils/logoutUser";
import styles from "../../styles/header.module.scss";
import { postDataWithXcsrf } from "../services/apiServices";
import { useRouter } from "next/router";

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu }) {
  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  });
  const router = useRouter();

  function handleClickOutside(event) {
    if (
      event.target.className !== "avatar" &&
      event.target.className !== "avatar__button"
    ) {
      setTimeout(toggle_avatar_menu(), 1600);
    }
  }

  const logoutReq = async () => {
    console.log("check");
    // logoutUser();
    try {
      await postDataWithXcsrf("LOGOUT_ADMIN", {
        phone: "9816456565",
      });
      logoutUser();
    } catch (e) {
      console.log("Logout Err", e);
    }
  };

  return (
    <div className={styles.avatar__menu}>
      <ul>
        <li>
          <button className="avatar__button">Account Info</button>
        </li>
        <li>
          <button className="avatar__button" onClick={logoutReq}>
            Logout
          </button>
        </li>
      </ul>
    </div>
  );
}

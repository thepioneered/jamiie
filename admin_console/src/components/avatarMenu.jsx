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
    console.log(event.target.className);
    if (event.target.className !== "avatar") {
      setTimeout(toggle_avatar_menu(), 1600);
    }
  }

  const logoutReq = async () => {
    console.log("check");
    try {
      await postDataWithXcsrf("LOGOUT_ADMIN", {
        phone: "7071006000",
      });
      logoutUser();
    } catch (e) {
      console.log("Logout Err", e);
    }
  };

  // logoutReq();

  return (
    <div className={styles.avatar__menu}>
      <ul>
        <li>
          <button className="avatar__button">Account Info</button>
        </li>
        <li>
          <button
            className="avatar__button"
            onClick={(e) => console.log("asdfasdf")}
          >
            Logout
          </button>
        </li>
      </ul>
    </div>
  );
}

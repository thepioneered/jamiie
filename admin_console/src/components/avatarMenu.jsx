import React from "react";
import { useEffect, useContext } from "react";
import styles from "../../styles/header.module.scss";
import { postDataWithXcsrf } from "../services/apiServices";
import { useRouter } from "next/router";
import { LoaderContext } from "../../pages/_app";

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu }) {
  const { state, changeGlobal } = useContext(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  function handleClickOutside(event) {
    if (
      event.target.className !== "avatar" &&
      event.target.className !== "avatar__button"
    ) {
      toggle_avatar_menu();
    }
  }

  const logoutReq = async () => {
    console.log("check");
    try {
      await postDataWithXcsrf("LOGOUT_ADMIN", {});
      changeGlobal("tokenValidated");
      router.push("/login");
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

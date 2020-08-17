import React from "react";
import { useEffect, useContext } from "react";
import styles from "../../styles/avatarMenu.module.scss";
import { postDataWithXcsrf } from "../services/apiServices";
import { useRouter } from "next/router";
import { LoaderContext } from "../../pages/_app";

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu }) {
  const { state, changeGlobal } = useContext(LoaderContext);
  const router = useRouter();

  function onClose() {
    toggle_avatar_menu();
  }

  const logoutReq = async () => {
    console.log("check");
    try {
      changeGlobal("layoutLoader");
      await postDataWithXcsrf("LOGOUT_ADMIN", {});
      changeGlobal("tokenValidated");
      changeGlobal("layoutLoader");
      router.push("/login");
    } catch (e) {
      console.log("Logout Err", e);
      changeGlobal("tokenValidated");
      changeGlobal("layoutLoader");
      router.push("/login");
    }
  };

  return (
    <>
      <div className={styles.backdrop} onClick={onClose} />
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
    </>
  );

  // <>
  //     <div className={styles.backdrop} onClick={onClose} />
  //     <div className={styles.modal} id="modal">
  //       <div className={styles.header__container}>
  //         <span>{props.header}</span>
  //         <span className={styles.close__icon} onClick={onClose}>
  //           x
  //         </span>
  //       </div>
  //       <div className={styles.content}>{props.children}</div>
  //     </div>
  //   </>
}

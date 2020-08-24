import React from "react";
import cn from "classnames";
import { useContext } from "react";
import styles from "../../styles/avatarMenu.module.scss";
import { postDataWithXcsrf } from "../services/apiServices";
import { useRouter } from "next/router";
import { LoaderContext } from "../../pages/_app";

// TODO useEffect dependency ?
export default function AvatarMenu({ toggle_avatar_menu, loginData }) {
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
      <div className={cn(styles.avatar__menu)}>
        <div className={styles.avatar}>{loginData && loginData.name[0]}</div>

        <div className={styles.name}>{loginData && loginData.name}</div>
        <div>{loginData && loginData.email}</div>

        <button className={styles.logout} onClick={logoutReq}>
          Sign Out
        </button>
      </div>
    </>
  );
}

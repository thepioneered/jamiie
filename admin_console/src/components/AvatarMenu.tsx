import React from "react";
import cn from "classnames";
import { useContext } from "react";
import styles from "../../styles/avatarMenu.module.scss";
import { useRouter } from "next/router";
import { LoaderContext } from "../../pages/_app";
import { loginData } from "../interfaces/global";
import { logout } from "../utils/apiCalls";

interface Props {
  toggleAvatarMenu: () => void;
  loginData: loginData;
}

// FIXME IF LOGOUT FAILS?

export default function AvatarMenu({
  toggleAvatarMenu: toggle_avatar_menu,
  loginData,
}: Props) {
  const { dispatch } = useContext(LoaderContext);
  const router = useRouter();

  function onClose() {
    toggle_avatar_menu();
  }

  const logoutReq = async () => {
    dispatch!({ type: "changeGlobal", item: "layoutLoader" });
    const r = await logout();

    if (r) {
      dispatch!({ type: "changeGlobal", item: "tokenValidated" });
      dispatch!({ type: "changeGlobal", item: "layoutLoader" });
      router.push("/login");
    } else {
      dispatch!({ type: "changeGlobal", item: "tokenValidated" });
      dispatch!({ type: "changeGlobal", item: "layoutLoader" });
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

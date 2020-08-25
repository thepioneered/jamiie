import React from "react";
import { AvatarMenu } from "./index";
import styles from "../../styles/header.module.scss";
import { useState } from "react";

function Header({ toggleSidebar, loginData }) {
  const [avatarMenuState, avatarMenuToggle] = useState(false);

  const toggleAvatarMenu = () => {
    avatarMenuToggle((prevState) => !prevState);
  };

  return (
    <div className={styles.Header}>
      <button className={styles.hamburger} onClick={toggleSidebar}>
        <span className="material-icons">menu</span>
      </button>
      <div className={styles.heading}>Admin Console - </div>
      <div className={styles.account__info}>
        <div className={styles.name}>{loginData && loginData.name}</div>
        <div>Admin</div>
      </div>
      <button className={styles.avatar} onClick={toggleAvatarMenu}>
        {loginData && loginData.name && loginData.name[0]}
      </button>
      {avatarMenuState ? (
        <AvatarMenu
          toggle_avatar_menu={toggleAvatarMenu}
          loginData={loginData}
        />
      ) : null}
    </div>
  );
}

export default Header;

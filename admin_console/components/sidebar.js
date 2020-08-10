import React from "react";
import cn from "classnames";
import styles from "../styles/sidebar.module.scss";
import Logo from "../public/images/svg/NewLogo.svg";

export default function Sidebar({ isSidebarOpen, changePage, index }) {
  function sendList() {
    return index.map((item) => {
      let li_class = cn(styles.not__active, {
        [styles.active]: item.active,
        [styles.li__close]: !isSidebarOpen,
      });

      return (
        <li
          key={item.name}
          className={li_class}
          onClick={() => changePage(item.name)}
        >
          <div
            className={cn(styles.index__icon, {
              [styles.index__icon__close]: !isSidebarOpen,
            })}
          >
            <span className="material-icons">{item.icon}</span>
          </div>
          {isSidebarOpen ? (
            <div className={styles.index__text}>{item.name}</div>
          ) : null}
        </li>
      );
    });
  }

  return (
    <div
      className={
        isSidebarOpen
          ? styles.Sidebar
          : cn(styles.Sidebar, styles.Sidebar__close)
      }
    >
      <div className={styles.logo__wrapper}>
        <Logo className={isSidebarOpen ? styles.logo : styles.logo__close} />
      </div>
      <ul className={styles.index}>{sendList()}</ul>
    </div>
  );
}

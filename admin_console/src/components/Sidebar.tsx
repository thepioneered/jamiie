import React from "react";
import Link from "next/link";
import { useRouter } from "next/router";
import cn from "classnames";
import styles from "../../styles/sidebar.module.scss";
import Logo from "../../public/images/svg/NewLogo.svg";

interface Props {
  isSidebarOpen: boolean;
}

export default function Sidebar({ isSidebarOpen }: Props) {
  function sendList() {
    const index = [
      { name: "Dashboard", icon: "dashboard" },
      { name: "ServerStats", icon: "dns" },
      { name: "Transactions", icon: "timeline" },
      { name: "Pools", icon: "group" },
      { name: "Users", icon: "person_outline" },
    ];

    const router = useRouter();
    const path = router.pathname.split("/")[2];

    return index.map((item) => {
      let li_class = cn(styles.not__active, {
        [styles.active]: item.name.toLowerCase() === path,
        [styles.li__close]: !isSidebarOpen,
      });

      return (
        <li key={item.name}>
          <Link href={`/admin/${item.name.toLowerCase()}`}>
            <a className={li_class}>
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
            </a>
          </Link>
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

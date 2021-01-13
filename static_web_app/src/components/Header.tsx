import React, { useState } from "react";
import Link from "next/link";
import styles from "../../styles/header.module.scss";

const Header = () => {
  const [show, setShow] = useState(false);

  return (
    <>
      <div className={styles.outer__container}>
        <Link href="/">
          <a>
            <img
              className={styles.logo}
              src="/images/svg/NewLogo.svg"
              alt="LOgo"
            />
          </a>
        </Link>
        <div className={styles.container}>
          <ul className={styles.list}>
            <li>
              <Link href="/">
                <a>Home</a>
              </Link>
            </li>
            <li>
              <Link href="/what">
                <a>Jamiie Circle</a>
              </Link>
            </li>
            <li>
              <Link href="/how">
                <a>How it works</a>
              </Link>
            </li>
            <li>
              <Link href="/ourstory">
                <a>Our story</a>
              </Link>
            </li>
            <li>
              <Link href="#">
                <a>Our team</a>
              </Link>
            </li>
            <li>
              <Link href="#">
                <a>FAQs</a>
              </Link>
            </li>
          </ul>
          <button className={styles.menu} onClick={() => setShow(!show)}>
            <img src="/images/svg/menu.svg" alt="menu" />
          </button>
        </div>
      </div>
      <ul className={`${styles.list2} ${show ? styles.show : null}`}>
        <li>
          <Link href="/">
            <a>Home</a>
          </Link>
        </li>
        <li>
          <Link href="/what">
            <a>Jamiie Circle</a>
          </Link>
        </li>
        <li>
          <Link href="/how">
            <a>How it works</a>
          </Link>
        </li>
        <li>
          <Link href="/ourstory">
            <a>Our story</a>
          </Link>
        </li>
        <li>
          <Link href="#">
            <a>Our team</a>
          </Link>
        </li>
        <li>
          <Link href="#">
            <a>FAQs</a>
          </Link>
        </li>
      </ul>
    </>
  );
};

export default Header;

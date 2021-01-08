import React, { useState } from "react";
import styles from "../../styles/header.module.scss";

const Header = () => {
  const [show, setShow] = useState(false);

  return (
    <>
      <div className={styles.outer__container}>
        <img className={styles.logo} src="/images/svg/NewLogo.svg" alt="LOgo" />
        <div className={styles.container}>
          <ul className={styles.list}>
            <li>
              <a href="#jamiie_circle">Jamiie Circle</a>
            </li>
            <li>
              <a href="#how">How it works</a>
            </li>
            <li>
              <a href="#our_story">Our story</a>
            </li>
            <li>
              <a href="#">Our team</a>
            </li>
            <li>
              <a href="#">FAQs</a>
            </li>
          </ul>
          <button className={styles.menu} onClick={() => setShow(!show)}>
            <span className="material-icons">menu</span>
          </button>
        </div>
      </div>
      <ul className={`${styles.list2} ${show ? styles.show : null}`}>
        <li>
          <a href="#jamiie_circle">Jamiie Circle</a>
        </li>
        <li>
          <a href="#how2">How it works</a>
        </li>
        <li>
          <a href="#our_story">Our story</a>
        </li>
        <li>
          <a href="#">Our team</a>
        </li>
        <li>
          <a href="#">FAQs</a>
        </li>
      </ul>
    </>
  );
};

export default Header;

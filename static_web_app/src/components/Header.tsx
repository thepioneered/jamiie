import React from "react";
import styles from "../../styles/header.module.scss";

const Header = () => {
  return (
    <div className={styles.outer__container}>
      <img className={styles.logo} src="/images/svg/NewLogo.svg" alt="LOgo" />
      <div className={styles.container}>
        <ul className={styles.list}>
          <li>
            <button>Jamiie Circle</button>
          </li>
          <li>
            <button>How it works</button>
          </li>
          <li>
            <button>Our story</button>
          </li>
          <li>
            <button>Our team</button>
          </li>
          <li>
            <button>FAQs</button>
          </li>
        </ul>
      </div>
    </div>
  );
};

export default Header;

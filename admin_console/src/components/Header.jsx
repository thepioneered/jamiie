import React from "react";
import { AvatarMenu } from "./index";
import styles from "../../styles/header.module.scss";
import { useState } from "react";

// TODO searchUnfocus timeout
function Header({ toggleSidebar }) {
  const [avatarMenuState, avatarMenuToggle] = useState(false);
  const [searchFocused, toggleSearchFocused] = useState(false);

  const toggleAvatarMenu = () => {
    avatarMenuToggle((prevState) => !prevState);
  };

  const addSearchContent = () => {
    toggleSearchFocused((prevState) => !prevState);
  };

  const removeSearchContent = () => {
    setTimeout(() => {
      toggleSearchFocused((prevState) => !prevState);
    }, 200);
  };

  const filterSearch = (event) => {
    const filter = event.target.value.toUpperCase();
    const a = document.getElementsByTagName("a");
    for (let i = 0; i < a.length; i++) {
      let txtValue = a[i].textContent || a[i].innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        a[i].style.display = "";
      } else {
        a[i].style.display = "none";
      }
    }
  };

  return (
    <div className={styles.Header}>
      <div className={styles.hamburger} onClick={toggleSidebar}>
        <span className="material-icons">menu</span>
      </div>
      {/* <div className={styles.searchbar}>
        <input
          type="text"
          className={styles.input}
          placeholder="Search"
          onFocus={addSearchContent}
          onBlur={removeSearchContent}
          onChange={(event) => filterSearch(event)}
        />
        <div
          className={styles.search__content}
          style={{
            display: searchFocused ? null : "none",
          }}
        >
          <a href="#about" className={styles.search__link}>
            About
          </a>
          <a href="#base" className={styles.search__link}>
            Base
          </a>
          <a href="#blog" className={styles.search__link}>
            Blog
          </a>
          <a href="#contact" className={styles.search__link}>
            Contact
          </a>
          <a href="#custom" className={styles.search__link}>
            Custom
          </a>
          <a href="#support" className={styles.search__link}>
            Support
          </a>
          <a href="#tools" className={styles.search__link}>
            Tools
          </a>
        </div>
        <span className={`material-icons ${styles.search__icon}`}>search</span>
        </div>*/}
      <div className={styles.heading}>Admin Console - </div>
      <div className={styles.account__info}>
        <div className={styles.name}>Paritosh Batish</div>
        <div className={styles.admin}>Admin</div>
      </div>
      <div className={styles.avatar} onClick={toggleAvatarMenu}>
        P
      </div>
      {avatarMenuState ? (
        <AvatarMenu toggle_avatar_menu={toggleAvatarMenu} />
      ) : null}
    </div>
  );
}

export default Header;

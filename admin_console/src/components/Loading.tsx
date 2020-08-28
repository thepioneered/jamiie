import React from "react";
import Logo from "../../public/images/svg/Vectors.svg";
import styles from "../../styles/loading.module.scss";

function Loading() {
  return (
    <div className={styles.container}>
      <div className={styles.Loading}>
        <Logo />
        <div className={styles.loading__text}></div>
      </div>
    </div>
  );
}

export default Loading;

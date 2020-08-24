import React from "react";
import styles from "../../styles/globalLoader.module.scss";

function GloablLoader() {
  return (
    <div className={styles.loader}>
      <div className={styles.spinner}></div>
    </div>
  );
}

export default GloablLoader;

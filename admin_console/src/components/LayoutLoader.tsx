import React from "react";
import styles from "../../styles/layoutLoader.module.scss";

const LayoutLoader = () => {
  return (
    <div className={styles.loader}>
      <div className={styles.spinner}></div>
    </div>
  );
};

export default LayoutLoader;

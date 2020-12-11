import React from "react";
import styles from "../../styles/mybutton.module.scss";

interface MyButtonProps {
  text?: string;
  style?: React.CSSProperties;
}

const MyButton = ({ text, style }: MyButtonProps) => {
  return (
    <div className={`${styles.container} ${styles.arrow}`} style={style}>
      <button className={styles.button}>
        {text ? text : "Start your Jamiie circle now"}
      </button>
    </div>
  );
};

export default MyButton;

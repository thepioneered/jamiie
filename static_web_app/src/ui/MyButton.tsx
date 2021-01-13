import React from "react";
import styles from "../../styles/mybutton.module.scss";

interface MyButtonProps {
  text?: string;
  style?: React.CSSProperties;
  className?: string;
}

const MyButton = ({ text, style, className }: MyButtonProps) => {
  return (
    <div className={styles.container} style={style}>
      <button className={`${styles.button} ${className}`}>
        {text ? text : "Start your Jamiie circle now"}
        {/* <img src="/images/svg/arrow_forward.svg" alt="Forward" /> */}
      </button>
    </div>
  );
};

export default MyButton;

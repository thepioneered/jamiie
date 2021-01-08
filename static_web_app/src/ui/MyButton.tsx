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
        <span className="material-icons">keyboard_arrow_right</span>
      </button>
    </div>
  );
};

export default MyButton;

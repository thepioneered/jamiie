import React from "react";
import styles from "../../styles/mybutton.module.scss";

interface MyButtonProps {
  text?: string;
  style?: React.CSSProperties;
}

const MyButton = ({ text, style }: MyButtonProps) => {
  return (
    <div className={styles.container} style={style}>
      {text ? text : "Start your Jamiie circle now"}
    </div>
  );
};

export default MyButton;

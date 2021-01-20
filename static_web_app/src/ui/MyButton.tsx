import React from "react";
import cn from "classnames";
import styles from "../../styles/mybutton.module.scss";

interface MyButtonProps {
  text?: string;
  style?: React.CSSProperties;
  className?: string;
  filled?: boolean;
}

const MyButton = ({
  text,
  style,
  className,
  filled = false,
}: MyButtonProps) => {
  return (
    <div className={styles.container} style={style}>
      <button
        className={cn(className, {
          [styles.button]: !filled,
          [styles.filled]: filled,
        })}
      >
        {text ? text : "Register for beta version"}
        {/* <img src="/images/svg/arrow_forward.svg" alt="Forward" /> */}
      </button>
    </div>
  );
};

export default MyButton;

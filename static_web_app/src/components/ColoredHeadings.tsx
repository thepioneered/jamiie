import React from "react";
import styles from "../../styles/coloredHeadings.module.scss";

interface ColoredHeadingsTypes {
  style?: React.CSSProperties;
}

const ColoredHeadings = ({ style }: ColoredHeadingsTypes) => {
  return (
    <div className={styles.container} style={style}>
      <div className="green">Doing-a-circle</div>
      <div className="yellow">Tanda</div>
      <div className="blue">Cundinac</div>
      <div className="red">Take-a-turn</div>
      <div className="purple">Merry-go-round</div>
      <div className="green">Susu</div>
    </div>
  );
};

export default ColoredHeadings;

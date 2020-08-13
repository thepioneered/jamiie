import React from "react";
import cn from "classnames";
import styles from "../../styles/totalCard.module.scss";

function totalCard({ name, number, percentage }) {
  const addCommasToNumber = number
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

  let color = "#39dc00";
  let status = "Up";
  let icon = "trending_up";

  if (percentage === 0) {
    color = "#a3a3a3";
    status = "Change";
    icon = "linear_scale";
  } else if (percentage < 0) {
    color = "#ea3a3a";
    status = "Down";
    icon = "trending_down";
  }

  return (
    <div className={cn(styles.card, "hover")}>
      <div className={styles.heading}>{name}</div>
      <div className={styles.number}>{addCommasToNumber}</div>
      {/* <div className={styles.description}>
        <span
          className={`material-icons ${styles.icon}`}
          style={{ color: color }}
        >
          {icon}
        </span>
        <span className={styles.percentage} style={{ color: color }}>
          &nbsp;{Math.abs(percentage)}%
        </span>
        <span className={styles.status}>&nbsp;{status} from Yesterday</span>
      </div> */}
    </div>
  );
}

export default totalCard;

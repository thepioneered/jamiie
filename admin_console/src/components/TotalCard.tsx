import React from "react";
import cn from "classnames";
import styles from "../../styles/totalCard.module.scss";

interface Props {
  name: string;
  number: number;
}

function totalCard({ name, number }: Props) {
  const addCommasToNumber = number
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

  return (
    <div className={cn(styles.card, "hover")}>
      <div className={styles.heading}>{name}</div>
      <div className={styles.number}>{addCommasToNumber}</div>
    </div>
  );
}

export default totalCard;

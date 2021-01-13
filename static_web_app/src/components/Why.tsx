import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";
import ColoredHeadings from "./ColoredHeadings";

const Why = () => {
  return (
    <>
      <div className={styles.heading}>Why start a Jamiie circle?</div>
      <div className={styles.para1__container}>
        <div className={`${styles.space__between} ${styles.order2}`}>
          <div>
            <p>
              Every feel like you are working hard and you’re not getting
              anywhere? Accelerate your savings with Jamiie. Not only are you
              able to pool resources, Jamiie gives a certain discipline and
              positive reinforcement to save. With your trusted circle of
              friends and family, together you can accomplish your goals.
            </p>
          </div>
        </div>
        <img
          src="/images/Picture1.jpg"
          alt="Picture1"
          className={styles.order1}
        />
      </div>

      <MyButton style={{ margin: "0 0 4em 0" }} />
      <ColoredHeadings style={{ margin: "0 0 2em 0", padding: "0" }} />
    </>
  );
};

export default Why;

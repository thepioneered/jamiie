import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";

const Why = () => {
  return (
    <>
      <div className={styles.para1__container}>
        <div className={styles.space__between}>
          <div>
            <div className={styles.heading}>Why start a Jamiie circle?</div>
            <p>
              Every feel like you are working hard and you’re not getting
              anywhere? Accelerate your savings with Jamiie. Not only are you
              able to pool resources, Jamiie gives a certain discipline and
              positive reinforcement to save. With your trusted circle of
              friends and family, together you can accomplish your goals.
            </p>
          </div>
          <MyButton />
        </div>
        <img src="/images/Picture1.jpg" alt="Picture1" />
      </div>
    </>
  );
};

export default Why;

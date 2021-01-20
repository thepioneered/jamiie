import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";

const Meet = () => {
  return (
    <>
      <div className={styles.heading}>Meet the “Achievers” Jamiie circle?</div>
      <div className={styles.para1__container} style={{ marginBottom: "4em" }}>
        <img src="/images/Picture5.jpg" alt="Picture5" />
        <div className={styles.space__between}>
          <div>
            <p>
              Mary, John, Peter, and Sharon stared their circle at the beginning
              of the year, taking turns they were each able to achieve their
              individual goals - buying a car, purchasing a home, and taking
              that dream trip to college
            </p>
          </div>
          <MyButton filled style={{ margin: "auto 0 0 1em" }} />
        </div>
      </div>
    </>
  );
};

export default Meet;

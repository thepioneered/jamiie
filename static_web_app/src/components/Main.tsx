import React from "react";
import styles from "../../styles/main.module.scss";
import ColoredHeadings from "./ColoredHeadings";
import MyButton from "../ui/MyButton";
import What from "./What";
import Meet from "./Meet";
import Why from "./Why";
import OurStory from "./OurStory";

const Main = () => {
  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Bring Your Dreams To Life</h1>
      <p className={`${styles.subheading} ${styles.center}`}>
        With the people you trust,
        <b> you can accelerate your savings, achieve your financial goals</b>
      </p>
      <div className={styles.img__container}>
        <img src="/images/Picture1.jpg" alt="Picture1" />
        <img src="/images/Picture2.jpg" alt="Picture2" />
        <img src="/images/Picture3.jpg" alt="Picture3" />
      </div>
      <ColoredHeadings />

      <p className={`${styles.desc} ${styles.center}`}>
        Whether you are dreaming about buying your first home, getting a new
        car, building your emergency funds, or even planning that next dream
        vacation, start a <b className="green">Jamiie circle </b>
        with the people you trust and you can realize your dreams even faster.
      </p>

      <What />
      {/* <ColoredHeadings style={{ margin: "0em 0 1em 0", padding: "0" }} /> */}

      <Meet />
      {/* <ColoredHeadings style={{ margin: "0em 0 1em 0", padding: "0" }} /> */}

      <Why />
      {/* <ColoredHeadings style={{ margin: "0em 0 1em 0", padding: "0" }} /> */}

      <img
        id="how"
        className={styles.howItWorks}
        src="/images/svg/HowItWorks2.svg"
        alt="How it Works"
      />
      {/* <ColoredHeadings style={{ margin: "0em 0 1em 0", padding: "0" }} /> */}

      <OurStory />
      <ColoredHeadings style={{ margin: "0em 0 1em 0", padding: "0" }} />
    </div>
  );
};

export default Main;

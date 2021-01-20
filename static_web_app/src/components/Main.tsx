import { useRouter } from "next/dist/client/router";
import React from "react";
import styles from "../../styles/main.module.scss";
import ColoredHeadings from "./ColoredHeadings";
import Meet from "./Meet";
import Why from "./Why";

const Main = () => {
  const router = useRouter();
  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Bring Your Dreams To Life</h1>
      <p className={`${styles.subheading} ${styles.center}`}>
        With the people you trust,
        <b> you can accelerate your savings, achieve your financial goals</b>
      </p>
      <div className={styles.img__container}>
        <img
          src="/images/Picture1.jpg"
          alt="Picture1"
          className={styles.hide__on__mob}
        />
        <img
          src="/images/Picture2.jpg"
          alt="Picture2"
          className={styles.hide__on__mob}
        />
        <img src="/images/Picture3.jpg" alt="Picture3" />
      </div>
      <ColoredHeadings style={{ padding: 0 }} />

      <p className={`${styles.desc} ${styles.center}`}>
        Whether you are dreaming about buying your first home, getting a new
        car, building your emergency funds, or even planning that next dream
        vacation, start a{" "}
        <b
          className={`green ${styles.little__link}`}
          onClick={() => router.push("/what")}
        >
          Jamiie circle{" "}
        </b>
        with the people you trust and you can realize your dreams even faster.
      </p>

      <Why />
      <Meet />
    </div>
  );
};

export default Main;

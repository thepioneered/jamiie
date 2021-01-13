import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";
import ColoredHeadings from "./ColoredHeadings";

const How = () => {
  return (
    <div className={styles.container}>
      <div className={styles.heading}>How it Works?</div>
      <img
        id="how"
        className={styles.howItWorks}
        src="/images/svg/HowItWorks2.svg"
        alt="How it Works"
      />
      <div className={styles.howItWorks2} id="how2">
        <table className={styles.table}>
          <tbody>
            <tr>
              <td className={styles.circle}>1</td>
              <td className={styles.content}>Open your jamiie Account</td>
            </tr>
            <tr>
              <td className={styles.circle}>2</td>
              <td className={styles.content}>
                Start a new jamiie circle and invite friends and family.
              </td>
            </tr>
            <tr>
              <td className={styles.circle}>3</td>
              <td className={styles.content}>
                Select the length of time, weeks or months, and the dates.
              </td>
            </tr>
            <tr>
              <td className={styles.circle}>4</td>
              <td className={styles.content}>
                Select the jamiie amount that each person will pool and the
                order of draws.
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <MyButton style={{ margin: "2em 0 3em 0" }} />
      <ColoredHeadings style={{ margin: "0em 0 2em 0", padding: "0" }} />
    </div>
  );
};

export default How;

import React from "react";
import styles from "../../styles/main.module.scss";

const What = () => {
  return (
    <>
      <div className={styles.para1__container} id="jamiie_circle">
        <div>
          <div className={styles.heading}>What is a Jamiie circle?</div>
          <div>
            <p>
              An online version of a centuries-old system of informal money pool
              through which friends and family help each other save to achieve
              financial goals.
            </p>
            <p>
              A trusted group of friend and/or family comes together to make
              agreed contributions for a given period, either weekly or monthly,
              as the group decides. For each period, once the contributions are
              made, the funds are disbursed to a single member. The receiver is
              changed after each period. It continues like this until all
              members of the group receive the same amount.
            </p>
            <p>
              For those at the end of the list, by the time they receive theirs,
              they would have effectively saved up to a certain amount.
            </p>
          </div>
        </div>
        <img src="/images/Picture1.jpg" alt="Picture1" />
      </div>
    </>
  );
};

export default What;

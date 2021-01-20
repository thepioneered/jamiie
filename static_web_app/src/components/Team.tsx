import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";
import ColoredHeadings from "./ColoredHeadings";

const Team = () => {
  return (
    <div className={styles.container}>
      <div className={styles.heading}>Our Team</div>
      <div className={styles.para1__container} style={{ marginTop: 0 }}>
        <div className={styles.team__outer__container}>
          <div className={styles.team__container}>
            <img
              src="/images/Picture13.png"
              alt="Picture13"
              className={styles.img13}
            />
            <p>
              Jaz is strategic solution provider with expertise in numerous
              domains. By qualification, finance and marketing professional. He
              holds experience in accounting, banking, underwriting, data
              science, machine learning, artificial intelligence, digital
              marketing, Information Technology and completed more than 100
              international certifications in above domains. He has completed
              his MBA from University business school, Panjab University,
              Chandigarh. He has managed to complete more than 100 projects in
              various domains at international so far.
            </p>
          </div>
          <div className={styles.team__container}>
            <img
              src="/images/Picture13.png"
              alt="Picture13"
              className={styles.img13}
            />
            <p>
              Gaurav Goyal, is a deep learning enthusiast who loves to dig
              solutions for real-life problems. Based out of Patiala, Punjab, he
              has done his Masters in Computer Science and Engineering from
              Chitkara University, Punjab. Furthermore, Gaurav has four SCI
              Journal Publications. His research background helps him to develop
              solutions that have a strong foundation.
            </p>
          </div>
          <div className={styles.team__container}>
            <img
              src="/images/Picture13.png"
              alt="Picture13"
              className={styles.img13}
            />
            <p>
              Rohan Sharma, is an astute developer. Made his career in
              Smallcase, a fintech startup, he can design and develop logics
              with best optimization. He is based out of Ludhiana and has
              completed his graduation in Bachelor of Engineering in Computer
              Science from Chitkara University, Punjab.
            </p>
          </div>
          <div className={styles.team__container}>
            <img
              src="/images/Picture13.png"
              alt="Picture13"
              className={styles.img13}
            />
            <p>
              Nitish Goyal, is a solution architect and technology geek. Made
              his career in VMware, he can architect and develop robust,
              scalable cloud-ready and cloud-native solutions with best cost
              optimizations. He is also skilled in Sales and Marketing for the
              company. He is based out of Chandigarh and has completed his
              graduation in Bachelor of Engineering in Computer Science from
              Chitkara University, Punjab.
            </p>
          </div>
        </div>
      </div>

      <MyButton style={{ margin: "2em 0 3em 0" }} filled />
      <ColoredHeadings style={{ margin: "0 0 1em 0", padding: "0" }} />
    </div>
  );
};

export default Team;

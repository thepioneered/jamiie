import React from "react";
import styles from "../../styles/main.module.scss";
import MyButton from "../ui/MyButton";

const OurStory = () => {
  return (
    <>
      <div style={{ marginTop: "5em" }}>
        <div className={styles.heading}>Our Story</div>
        <div className={styles.para1__container} style={{ marginTop: 0 }}>
          <div className={styles.space__between}>
            <div>
              <p>
                Nicole was born in Kingston, Jamaica, and migrated to the United
                States at the age of 15. As she grew up, she became aware of
                something Jamaicans called the partner that her mom participated
                in religiously. She realized that this was a way of life for
                most Jamaican immigrants. Among most of my international friends
                from other Caribbean and African countries, I realized that we
                were not unique, but this was part of many other cultures as
                well. The Haitians called it Susu, Jamaican’s called it Partner.
              </p>
              <p>
                 Over my 40 years of being around Partner, this has been the
                lifeline and the leg-up for hundreds of Jamaicans, and I saw
                that firsthand with my mother, who has repeatedly told me that
                without Partner, she would not have been able to buy her house,
                her car and send me to university. Based on my research, I have
                learned that it’s the same story for millions across the
                diasporas in Africa, the Caribbean, Latin America, and Asia over
                many centuries.
              </p>
            </div>
            <MyButton style={{ marginTop: "1em" }} />
          </div>
          <img src="/images/Picture13.png" alt="Picture13" />
        </div>
      </div>
    </>
  );
};

export default OurStory;

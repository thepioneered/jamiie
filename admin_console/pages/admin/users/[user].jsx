import React from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { Layout } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";

function User() {
  const router = useRouter();
  const { user } = router.query;

  return (
    <Layout>
      <div className={styles.outer__container}>
        <div className={styles.container}>
          <div className={styles.heading__container}>
            <button
              className={styles.back__button}
              onClick={(_e) => router.back()}
            >
              <span className="material-icons">keyboard_backspace</span>
            </button>
            <h2 className={styles.heading}>User Id: {user}</h2>
          </div>
          <div className={cn(styles.card, "hover")}>
            <div className={styles.picture}>
              <img src="/images/user.jpg" alt="user" />
            </div>
            <div className={styles.table__container}>
              <table className={styles.table}>
                <tr>
                  <th>Name:</th>
                  <td>Paritosh Batish</td>
                </tr>
                <tr>
                  <th>Email:</th>
                  <td>batishparitosh2@gmail.com</td>
                </tr>
                <tr>
                  <th>Mobile:</th>
                  <td>8146990621</td>
                </tr>
                <tr>
                  <th>Risk Score:</th>
                  <td>54</td>
                </tr>
                <tr>
                  <th>Risk Band:</th>
                  <td>Punjab</td>
                </tr>
                <tr>
                  <th>State:</th>
                  <td>Moderate</td>
                </tr>
                <tr>
                  <th>City:</th>
                  <td>Chandigarh</td>
                </tr>
                <tr>
                  <th>Date Created:</th>
                  <td>20th Aug 2020</td>
                </tr>
                <tr>
                  <th>Last Login:</th>
                  <td>6th Sept. 2020 4:40pm</td>
                </tr>
                <tr>
                  <th>Job Age:</th>
                  <td>Upto 4 years</td>
                </tr>
                <tr>
                  <th>Family:</th>
                  <td>Single with Children</td>
                </tr>
                <tr>
                  <th>State:</th>
                  <td>Punjab</td>
                </tr>
                <tr>
                  <th>Age:</th>
                  <td>{"<25 Years"}</td>
                </tr>
                <tr>
                  <th>Saving Money:</th>
                  <td>2-3</td>
                </tr>
                <tr>
                  <th>Loans:</th>
                  <td>1 on no loan</td>
                </tr>
                <tr>
                  <th>Living:</th>
                  <td>3</td>
                </tr>
                <tr>
                  <th>Block User:</th>
                  <td>
                    <button className={styles.block__user}>Block User</button>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default User;

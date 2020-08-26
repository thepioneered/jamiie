import React, { useState } from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { Layout, Modal } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";
import userStyles from "../../../styles/users.module.scss";

function User() {
  const router = useRouter();
  const { group } = router.query;

  const [showModal, toggleModal] = useState(false);
  const deleteUser = () => {
    toggleModal(true);
  };

  const closeModal = () => {
    toggleModal(false);
  };

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
            <h2 className={styles.heading}>Group Id: {group}</h2>
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
                  <th>Block Group:</th>
                  <td>
                    <button className={styles.block__user} onClick={deleteUser}>
                      Block Group
                    </button>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
      <Modal
        show={showModal}
        onClose={closeModal}
        header={"Are you sure that you want to block this user?"}
      >
        <div className={userStyles.note}>
          <b>Note:</b> The user cannot be blocked if he/she has already joined
          pool that has started.
        </div>
        <button className={userStyles.block__user}>Block User</button>
        <button className={userStyles.cancel}>Cancel</button>
      </Modal>
    </Layout>
  );
}

export default User;

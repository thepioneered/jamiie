import React, { useState } from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { Layout, Modal } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";
import userStyles from "../../../styles/users.module.scss";
import Link from "next/link";

function Transaction() {
  const router = useRouter();
  const { pool } = router.query;

  const [showModal, toggleModal] = useState(false);

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
            <h2 className={styles.heading}>Pool Id: {pool}</h2>
          </div>
          <div className={cn(styles.card, "hover")}>
            <div className={styles.table__container}>
              <table className={styles.table}>
                <tbody>
                  <tr>
                    <th>Pool Name:</th>
                    <td>Paritosh's Pool</td>
                  </tr>
                  <tr>
                    <th>Pool Owner:</th>
                    <td>
                      <Link
                        href="/admin/users/[user]"
                        as={`/admin/users/8146990621`}
                      >
                        <a>8146990621</a>
                      </Link>
                    </td>
                  </tr>
                  <tr>
                    <th>Contribution Amount:</th>
                    <td>580</td>
                  </tr>
                  <tr>
                    <th>Deadline:</th>
                    <td>{new Date("01 Mar 2020").toLocaleString("en-US")}</td>
                  </tr>
                  <tr>
                    <th>Pool Type:</th>
                    <td>Weekly</td>
                  </tr>
                  <tr>
                    <th>Members:</th>
                    <td>2 / 5</td>
                  </tr>
                  <tr>
                    <th>Status:</th>
                    <td>Not Started</td>
                  </tr>
                </tbody>
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

export default Transaction;

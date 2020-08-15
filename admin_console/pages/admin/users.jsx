import React, { useState } from "react";
import cn from "classnames";
import { Layout, TotalCard, Modal } from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";

function Users() {
  const [data, changeData] = useState([
    {
      no: "1.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "2.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "3.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "4.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "5.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "6.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "7.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "8.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "9.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
    {
      no: "10.",
      name: "Paritosh",
      date: "24th August 2020",
      status: "Active",
    },
  ]);
  const [showModal, toggleModal] = useState(false);
  const [modalHeader, setModalHeader] = useState("User Info");

  const getRows = (arr) => {
    return arr.map((item) => row(item));
  };

  const deleteUser = () => {
    setModalHeader("Are You Sure?");
    toggleModal(true);
  };

  const openModal = () => {
    setModalHeader("User Info");
    toggleModal(true);
  };

  const closeModal = () => {
    toggleModal(false);
  };

  const row = ({ no, name, date, status }) => {
    return (
      <tr key={no}>
        <td>{no}</td>
        <td>{name}</td>
        <td>{date}</td>
        <td>{status}</td>
        <td className={styles.action}>
          <span
            className={cn("material-icons", styles.delete)}
            onClick={deleteUser}
          >
            delete_outline
          </span>
          {/* <span
            className={cn("material-icons-outlined", styles.info)}
            onClick={openModal}
          >
            info
          </span> */}
          <span
            className={cn("material-icons-outlined", styles.settings)}
            onClick={openModal}
          >
            settings
          </span>
        </td>
      </tr>
    );
  };

  return (
    <Layout>
      <div className={styles.User}>
        <div className={card.container}>
          <TotalCard name="Total Users" number="22544" percentage="0.4" />
          <TotalCard name="Active Users" number="46289" percentage="-1.4" />
          <TotalCard name="Logged Out Users" number="33289" percentage="0" />
        </div>
        <div className={cn(styles.container, "hover")}>
          <div className={styles.heading}>Users</div>
          <div className={styles.table__container}>
            <table className={styles.table} cellSpacing="0">
              <thead>
                <tr className={styles.theading}>
                  <td>#</td>
                  <td>Name</td>
                  <td>Date Created</td>
                  <td>Created On</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody>{getRows(data)}</tbody>
            </table>
          </div>
        </div>
        <Modal show={showModal} onClose={closeModal} header={modalHeader}>
          ......Modal......
        </Modal>
      </div>
    </Layout>
  );
}

export default Users;

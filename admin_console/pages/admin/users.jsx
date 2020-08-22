import React, { useState, useContext } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import { Layout, TotalCard, Modal, GlobalLoader } from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";

function Users() {
  const { state } = useContext(LoaderContext);

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
  const [from, setFrom] = useState(0);
  const [isLoading, setLoading] = useState(false);

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
            className={cn("material-icons-outlined", styles.settings)}
            onClick={openModal}
            title="User Settings"
          >
            settings
          </span>
          <span
            className={cn("material-icons", styles.delete)}
            onClick={deleteUser}
            title="Block User"
          >
            remove_circle_outline
          </span>
        </td>
      </tr>
    );
  };

  const search = (e) => {
    e.preventDefault();
  };

  return (
    <Layout>
      <div className={styles.User}>
        <div className={card.container}>
          <TotalCard
            name="Total Users"
            number={state.totalData.totalUsers}
            percentage="0.4"
          />
          <TotalCard
            name="Active Users"
            number={state.totalData.activeUsers}
            percentage="-1.4"
          />
          <TotalCard
            name="Logged Out Users"
            number={state.totalData.loggedOutUsers}
            percentage="0"
          />
        </div>
        <div className={cn(styles.container, "hover")}>
          <div className={styles.heading}>
            <div className={styles.heading__title}>Users</div>
            <form className={styles.searchbar} onSubmit={search} method="POST">
              <input
                type="text"
                className={styles.input}
                placeholder="Search by User ID"
                required={true}
                // onFocus={addSearchContent}
                // onBlur={removeSearchContent}
                // onChange={(event) => filterSearch(event)}
              />
              <button className={styles.search__button}>
                <span className={"material-icons"}>search</span>
              </button>
            </form>
          </div>
          <div
            className={cn(styles.table__container, {
              loading__container: isLoading,
            })}
          >
            {isLoading ? (
              <GlobalLoader />
            ) : (
              <>
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

                <div className={styles.next__prev__container}>
                  <button
                    className={cn(styles.prev, styles.button, {
                      [styles.disabled]: from === 0,
                    })}
                    disabled={from === 0}
                    onClick={(_e) => setFrom((prev) => prev - 10)}
                  >
                    Previous
                  </button>
                  <button
                    className={cn(styles.next, styles.button)}
                    onClick={(_e) => setFrom((prev) => prev + 10)}
                  >
                    Next
                  </button>
                </div>
              </>
            )}
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

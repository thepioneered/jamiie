import React, { useState, useContext } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import {
  Layout,
  TotalCard,
  Modal,
  GlobalLoader,
  UserTable,
} from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";

function Users() {
  const { state } = useContext(LoaderContext);
  const [data, changeData] = useState([
    {
      no: "8146990621",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990622",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990623",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990624",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990625",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990626",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990627",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990628",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990629",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
    {
      no: "8146990630",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
    },
  ]);

  const [showModal, toggleModal] = useState(false);
  const [from, setFrom] = useState(0);
  const [isLoading, setLoading] = useState(false);

  const deleteUser = () => {
    toggleModal(true);
  };

  const closeModal = () => {
    toggleModal(false);
  };

  const search = (e) => {
    e.preventDefault();
  };

  return (
    <Layout>
      <div className={styles.user__container}>
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
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
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
                <UserTable
                  data={data}
                  deleteUser={deleteUser}
                  setFrom={setFrom}
                  from={from}
                />
              )}
            </div>
          </div>
          <Modal
            show={showModal}
            onClose={closeModal}
            header={"Are you sure that you want to block this user?"}
          >
            <div className={styles.note}>
              <b>Note:</b> The user cannot be blocked if he/she has already
              joined pool that has started.
            </div>
            <button className={styles.block__user}>Block User</button>
            <button className={styles.cancel}>Cancel</button>
          </Modal>
        </div>
      </div>
    </Layout>
  );
}

export default Users;

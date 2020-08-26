import React, { useState, useContext } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import {
  Layout,
  TotalCard,
  Modal,
  GlobalLoader,
  PoolTable,
} from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";

function Users() {
  const { state } = useContext(LoaderContext);
  const [data, changeData] = useState([
    {
      no: "8be74eg1",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg2",
      name: "Paritosh",
      date: "24th August 2020",
      status: "not started",
      members: 12,
    },
    {
      no: "8be74eg3",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg4",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg5",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg6",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg7",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg8",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74eg9",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
    },
    {
      no: "8be74e10",
      name: "Paritosh",
      date: "24th August 2020",
      status: "started",
      members: 12,
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
              name="Total Pools"
              number={state.totalData.totalUsers}
              percentage="0.4"
            />
            <TotalCard
              name="Active Pools"
              number={state.totalData.activeUsers}
              percentage="-1.4"
            />
            <TotalCard
              name="Completed Pools"
              number={state.totalData.loggedOutUsers}
              percentage="0"
            />
          </div>
          <div className={cn(styles.container, "hover")}>
            <div className={styles.heading}>
              <div className={styles.heading__title}>Pools</div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Pool ID"
                  required={true}
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
                <PoolTable
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

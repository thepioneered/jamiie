import React, { useState, useContext, useEffect } from "react";
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
import { getUserArray } from "../../src/utils/apiCalls";
import { userDetail } from "../../src/interfaces";

function Users() {
  const { state } = useContext(LoaderContext);
  const [data, setData] = useState<userDetail | null>(null);
  const [showModal, toggleModal] = useState(false);
  const [isLoading, setLoading] = useState(true);

  const getData = async (url?: string) => {
    setLoading(true);
    const r = await getUserArray(url);
    if (r) {
      setData(r);
      setLoading(false);
    }
  };

  useEffect(() => {
    getData();
  }, []);

  const deleteUser = () => {
    toggleModal(true);
  };

  const closeModal = () => {
    toggleModal(false);
  };

  const search = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
  };

  return (
    <Layout>
      <div className={styles.user__container}>
        <div className={styles.User}>
          <div className={card.container}>
            <TotalCard name="Total Users" number={state.totalData.totalUsers} />
            <TotalCard
              name="Active Users"
              number={state.totalData.activeUsers}
            />
            <TotalCard
              name="Logged Out Users"
              number={state.totalData.loggedOutUsers}
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
                  data={data!}
                  deleteUser={deleteUser}
                  pageChange={getData}
                />
              )}
            </div>
          </div>
          <Modal
            show={showModal}
            onClose={closeModal}
            header="Are you sure that you want to block this user?"
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

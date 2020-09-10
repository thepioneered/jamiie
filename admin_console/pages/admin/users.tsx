import cn from "classnames";
import React, { useContext, useEffect, useState } from "react";
import {
  GlobalLoader,
  Layout,
  Modal,
  TotalCard,
  UserTable,
} from "../../src/components";
import { endpoints } from "../../src/constants/apiEndpoints";
import { tableArray, user } from "../../src/interfaces";
import { fetchData } from "../../src/utils/apiCalls";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";
import { LoaderContext } from "../_app";

// TODO: if getData Fails?
function Users() {
  const { state } = useContext(LoaderContext);
  const [data, setData] = useState<tableArray<user> | null>(null);
  const [showModal, toggleModal] = useState(false);
  const [isLoading, setLoading] = useState(true);

  const getData = async (url?: string) => {
    setLoading(true);

    let r: tableArray<user> | false;
    if (url) r = await fetchData<tableArray<user>>({ url, domain: false });
    else r = await fetchData<tableArray<user>>({ url: endpoints.USER_DETAILS });

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

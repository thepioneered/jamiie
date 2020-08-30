import React, { useState, useContext } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import {
  Layout,
  TotalCard,
  GlobalLoader,
  PoolTable,
} from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";
import { Pool } from "../../src/interfaces/tables";

function Users() {
  const { state } = useContext(LoaderContext);
  const data: Pool[] = [
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
  ];
  const [from, setFrom] = useState(0);
  // const [isLoading, setLoading] = useState(false);
  const isLoading = false;

  const search = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
  };

  return (
    <Layout>
      <div className={styles.user__container}>
        <div className={styles.User}>
          <div className={card.container}>
            <TotalCard name="Total Pools" number={state.totalData.totalUsers} />
            <TotalCard
              name="Active Pools"
              number={state.totalData.activeUsers}
            />
            <TotalCard
              name="Completed Pools"
              number={state.totalData.loggedOutUsers}
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
                <PoolTable data={data} setFrom={setFrom} from={from} />
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Users;

import React, { useState, useContext } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import {
  Layout,
  TotalCard,
  GlobalLoader,
  TransactionTable,
} from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";
import { Transaction } from "../../src/interfaces/tables";

function Transactions() {
  const { state } = useContext(LoaderContext);
  const data: Transaction[] = [
    {
      no: "8146990621",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990622",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990623",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990624",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990625",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990626",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990627",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990628",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990629",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
    },
    {
      no: "8146990630",
      name: "Paritosh",
      date: "24th August 2020",
      status: "21st Sept. 2020",
      members: "12",
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
            <TotalCard
              name="Total Transactions"
              number={state.totalData.totalUsers}
            />
          </div>
          <div className={cn(styles.container, "hover")}>
            <div className={styles.heading}>
              <div className={styles.heading__title}>Transaction</div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Transaction ID"
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
                <TransactionTable data={data} setFrom={setFrom} from={from} />
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Transactions;

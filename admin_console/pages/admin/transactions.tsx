import React, { useState, useContext, useEffect } from "react";
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
import { tableArray } from "../../src/interfaces";
import { fetchData } from "../../src/utils/apiCalls";
import { endpoints } from "../../src/constants/apiEndpoints";

function Transactions() {
  const { state } = useContext(LoaderContext);

  const [data, setData] = useState<tableArray<Transaction> | null>(null);
  const [isLoading, setLoading] = useState(true);

  const getData = async (url?: string) => {
    setLoading(true);

    let r: tableArray<Transaction> | false;
    if (url)
      r = await fetchData<tableArray<Transaction>>({ url, domain: false });
    else
      r = await fetchData<tableArray<Transaction>>({
        url: endpoints.TRANSACTIONS,
      });

    if (r) {
      setData(r);
      setLoading(false);
    }
  };

  useEffect(() => {
    getData();
  }, []);

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
              number={state.loginData.totalTransactions}
            />
          </div>
          <div className={cn(styles.container, "hover")}>
            <div className={styles.heading}>
              <div className={styles.heading__title}>
                Transaction <span>Management</span>
              </div>
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
              ) : data!.results.length ? (
                <TransactionTable data={data!} pageChange={getData} />
              ) : (
                <div className={styles.empty__table}>No Transactions.</div>
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Transactions;

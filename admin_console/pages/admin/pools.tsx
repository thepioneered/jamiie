import React, { useState, useContext, useEffect } from "react";
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
import { fetchData } from "../../src/utils/apiCalls";
import { tableArray, pool } from "../../src/interfaces";
import { endpoints } from "../../src/constants/apiEndpoints";

function Users() {
  const { state } = useContext(LoaderContext);
  const [data, setData] = useState<tableArray<pool> | null>(null);
  const [isLoading, setLoading] = useState(true);

  const getData = async (url?: string) => {
    setLoading(true);

    let r: tableArray<pool> | false;
    if (url) r = await fetchData<tableArray<pool>>({ url, domain: false });
    else r = await fetchData<tableArray<pool>>({ url: endpoints.POOL_DETAILS });

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
                <PoolTable data={data!} pageChange={getData} />
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Users;

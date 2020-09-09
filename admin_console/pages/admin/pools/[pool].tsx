import React, { useState, useEffect } from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { Layout, GlobalLoader } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";
import userStyles from "../../../styles/users.module.scss";
import Link from "next/link";
import { poolFull } from "../../../src/interfaces";
import { fetchData } from "../../../src/utils/apiCalls";
import { endpoints } from "../../../src/constants/apiEndpoints";
import JoinedTable from "../../../src/components/JoinedTable";

function Pool() {
  const router = useRouter();
  const { pool } = router.query;

  const [data, setData] = useState<poolFull | null>(null);
  const [isLoading, setLoading] = useState(true);

  const getData = async () => {
    setLoading(true);
    console.log(pool);
    console.log(endpoints.SINGLE_POOL + pool);
    const r = await fetchData<poolFull>({
      url: endpoints.SINGLE_POOL + pool + "/",
    });

    if (r) {
      setData(r);
      setLoading(false);
    }
  };

  const search = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
  };

  useEffect(() => {
    getData();
  }, []);

  return (
    <Layout>
      <div className={styles.outer__container}>
        <div className={styles.container}>
          <div className={styles.heading__container}>
            <button
              className={styles.back__button}
              onClick={(_e) => router.back()}
            >
              <span className="material-icons">keyboard_backspace</span>
            </button>
            <h2 className={styles.heading}>Pool Id: {pool}</h2>
          </div>
          <div
            className={cn(styles.card, "hover", {
              loading__container: isLoading,
            })}
          >
            {isLoading ? (
              <GlobalLoader />
            ) : (
              <div className={styles.table__container}>
                <table className={styles.table}>
                  <tbody>
                    <tr>
                      <th>Pool Name:</th>
                      <td>{data?.poolName}</td>
                    </tr>
                    <tr>
                      <th>Pool Owner:</th>
                      <td>
                        <Link
                          href="/admin/users/[user]"
                          as={`/admin/users/8146990621`}
                        >
                          <a className={styles.page__link}>{data?.poolOwner}</a>
                        </Link>
                      </td>
                    </tr>
                    <tr>
                      <th>Contribution Amount:</th>
                      <td>{data?.contributionAmount}</td>
                    </tr>
                    <tr>
                      <th>Created on:</th>
                      <td>
                        {new Date(data!.createdAt).toLocaleString("en-US")}
                      </td>
                    </tr>
                    <tr>
                      <th>Deadline:</th>
                      <td>
                        {new Date(data!.deadline).toLocaleString("en-US")}
                      </td>
                    </tr>
                    <tr>
                      <th>Pool Type:</th>
                      <td>{data?.poolType}</td>
                    </tr>
                    <tr>
                      <th>Members:</th>
                      <td>{`${data?.joinedMember} / ${data?.totalMember}`}</td>
                    </tr>
                    <tr>
                      <th>Status:</th>
                      <td>
                        {data?.startStatus ? "Pool Started" : "Not Started"}
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            )}
          </div>
          <div
            className={cn(userStyles.container, "hover")}
            style={{ margin: "2rem 0 0 0" }}
          >
            <div className={userStyles.heading}>
              <div className={styles.table__heading}>Joined</div>
              <form
                className={userStyles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={userStyles.input}
                  placeholder="Search by User ID"
                  required={true}
                />
                <button className={userStyles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(userStyles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading ? (
                <GlobalLoader />
              ) : (
                <JoinedTable data={data!.joinedpool} />
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Pool;

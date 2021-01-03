import React, { useEffect, useState } from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { GlobalLoader, Layout } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";
import { singleTransaction } from "../../../src/interfaces";
import { endpoints } from "../../../src/constants/apiEndpoints";
import { postData } from "../../../src/utils/apiCalls";
import Link from "next/link";

function Transaction() {
  const router = useRouter();
  const { transaction } = router.query;

  const [data, setData] = useState<singleTransaction | null>(null);
  const [isLoading, setLoading] = useState(true);

  const getData = async () => {
    setLoading(true);
    const r = await postData<singleTransaction>({
      url: endpoints.SINGLE_TRANSACTION,
      payload: { transactionId: transaction },
    });

    if (r) {
      setData(r);
      setLoading(false);
    }
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
            <h2 className={styles.heading}>Transaction Id: {transaction}</h2>
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
                      <th>Pool:</th>
                      <td>
                        <Link
                          href="/admin/pools/[pool]"
                          as={`/admin/pools/${data?.poolId}`}
                        >
                          <a className={styles.page__link}>{data?.poolId}</a>
                        </Link>
                      </td>
                    </tr>
                    <tr>
                      <th>User:</th>
                      <td>
                        <Link
                          href="/admin/users/[user]"
                          as={`/admin/users/${data?.phone}`}
                        >
                          <a className={styles.page__link}>{data?.phone}</a>
                        </Link>
                      </td>
                    </tr>
                    <tr>
                      <th>Amount:</th>
                      <td>{data?.amount}</td>
                    </tr>
                    <tr>
                      <th>Date:</th>
                      <td>
                        {new Date(data!.paidTime).toLocaleString("en-US")}
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Transaction;

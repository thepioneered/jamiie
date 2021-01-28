import React from "react";
import cn from "classnames";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import loanStyles from "../../styles/loans.module.scss";
import { Transaction } from "../interfaces/tables";
import { tableArray } from "../interfaces";

interface Props {
  data: tableArray<Transaction>;
  pageChange: (url?: string | undefined) => Promise<void>;
}

function TransactionTable({ data, pageChange }: Props) {
  const row = ({
    id,
    transactionUrl,
    amount,
    paidTime,
    poolId,
    phone,
    lateTransactionStatus,
  }: Transaction) => {
    const newTransactionUrl = transactionUrl.replace(/\//g, "_");
    console.log(newTransactionUrl);

    return (
      <tr key={transactionUrl}>
        <td>
          <Link
            href="/admin/transactions/[transaction]"
            as={`/admin/transactions/${newTransactionUrl}`}
          >
            <a className={styles.page__link}>{id}</a>
          </Link>
        </td>
        <td>
          <Link href="/admin/pools/[pool]" as={`/admin/pools/${poolId}`}>
            <a className={styles.page__link}>{poolId}</a>
          </Link>
        </td>
        <td>
          <Link href="/admin/users/[user]" as={`/admin/users/${phone}`}>
            <a className={styles.page__link}>{phone}</a>
          </Link>
        </td>
        <td>{amount}</td>
        <td>{new Date(paidTime).toLocaleString("en-US")}</td>
        <td>{lateTransactionStatus ? "Late" : "On Time"}</td>
      </tr>
    );
  };

  const getRows = (arr: Transaction[]) => {
    return arr.map((item) => row(item));
  };

  return (
    <>
      <table className={loanStyles.table} cellSpacing="0">
        <thead>
          <tr className={styles.theading}>
            <td>Transaction Id</td>
            <td>Pool Id</td>
            <td>User Id</td>
            <td>Amount</td>
            <td>Paid Time</td>
            <td>Status</td>
          </tr>
        </thead>
        <tbody>{getRows(data.results)}</tbody>
      </table>

      <div className={styles.next__prev__container}>
        <button
          className={cn(styles.prev, styles.button, {
            [styles.disabled]: data.previous === null,
          })}
          disabled={data.previous === null}
          onClick={(_e) => pageChange(data.previous!)}
        >
          Previous
        </button>
        <button
          className={cn(styles.next, styles.button, {
            [styles.disabled]: data.next === null,
          })}
          disabled={data.next === null}
          onClick={(_e) => pageChange(data.next!)}
        >
          Next
        </button>
      </div>
    </>
  );
}

export default TransactionTable;

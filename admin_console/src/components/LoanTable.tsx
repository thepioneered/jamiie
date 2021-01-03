import React from "react";
import cn from "classnames";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import loanStyles from "../../styles/loans.module.scss";
import { tableArray } from "../interfaces";
import { Loan } from "../interfaces/tables";
import { postData } from "../utils/apiCalls";
import { endpoints } from "../constants/apiEndpoints";

interface Props {
  data: tableArray<Loan>;
  pageChange: (url?: string | undefined) => Promise<void>;
}

export default function LoanTable({ data, pageChange }: Props) {
  const handleApproval = async (transactionId: string) => {
    const r = await postData({
      url: endpoints.LOAN_APPROVAL,
      payload: { transactionId: transactionId },
    });
    if (r) {
      console.log("done");
    }
  };

  const handleDecline = async (transactionId: string) => {
    const r = await postData({
      url: endpoints.LOAN_DECLINE,
      payload: { transactionId: transactionId },
    });
    if (r) {
      console.log("done");
    }
  };

  const row = ({ transactionId, poolId, user, amount, createdAt }: Loan) => {
    return (
      <tr key={transactionId}>
        <td>
          <Link
            href="/admin/transactions/[transaction]"
            as={`/admin/transactions/${transactionId}`}
          >
            <a className={styles.page__link}>{transactionId}</a>
          </Link>
        </td>
        <td>
          <Link href="/admin/pools/[pool]" as={`/admin/pools/${poolId}`}>
            <a className={styles.page__link}>{poolId}</a>
          </Link>
        </td>
        <td>
          <Link href="/admin/users/[user]" as={`/admin/users/${user}`}>
            <a className={styles.page__link}>{user}</a>
          </Link>
        </td>
        <td>{amount}</td>
        <td>{new Date(createdAt).toLocaleString("en-US")}</td>
        <td>
          <button
            className={loanStyles.approve}
            onClick={() => handleApproval(transactionId)}
          >
            Approve
          </button>
        </td>
        <td>
          <button
            className={loanStyles.decline}
            onClick={() => handleDecline(transactionId)}
          >
            Decline
          </button>
        </td>
      </tr>
    );
  };

  const getRows = (arr: Loan[]) => {
    return arr.map((item) => row(item));
  };

  return (
    <>
      <table className={loanStyles.table} cellSpacing="0">
        <thead>
          <tr className={styles.theading}>
            <td>Transaction Id</td>
            <td>Pool Id</td>
            <td>User</td>
            <td>Amount</td>
            <td>Date Created</td>
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

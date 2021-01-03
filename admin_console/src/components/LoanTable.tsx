import React from "react";
import cn from "classnames";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import loanStyles from "../../styles/loans.module.scss";
import { tableArray } from "../interfaces";
import { Loan } from "../interfaces/tables";
import { postData } from "../utils/apiCalls";
import { endpoints } from "../constants/apiEndpoints";
import { Actions } from "../utils/globalReducer";

interface Props {
  data: tableArray<Loan>;
  setData?: React.Dispatch<React.SetStateAction<tableArray<Loan> | null>>;
  setData2?: React.Dispatch<React.SetStateAction<tableArray<Loan> | null>>;
  setData3?: React.Dispatch<React.SetStateAction<tableArray<Loan> | null>>;
  dispatch?: React.Dispatch<Actions>;
  pageChange: (url?: string | undefined) => Promise<void>;
  noButton?: boolean;
}

export default function LoanTable({
  data,
  setData,
  setData2,
  setData3,
  dispatch,
  pageChange,
  noButton = false,
}: Props) {
  const handleApproval = async (
    id: number,
    amount: number,
    createdAt: string,
    transactionId: string,
    paid: boolean,
    approved: boolean,
    phone: string,
    poolId: string
  ) => {
    const r = await postData({
      url: endpoints.LOAN_APPROVAL,
      payload: { transactionId: transactionId },
    });
    if (r) {
      setData!(
        (prev): tableArray<Loan> => {
          const newResults = prev!.results.filter(
            (item) => item.transactionId !== transactionId
          );

          return { ...prev!, results: newResults };
        }
      );
      setData3!(
        (prev): tableArray<Loan> => {
          const newResults = [
            ...prev!.results,
            {
              transactionId,
              poolId,
              phone,
              amount,
              createdAt,
              approved,
              id,
              paid,
            },
          ];

          return { ...prev!, results: newResults };
        }
      );
      dispatch!({ type: "incrementApprovedLoans" });
    }
  };

  const handleDecline = async (
    id: number,
    amount: number,
    createdAt: string,
    transactionId: string,
    paid: boolean,
    approved: boolean,
    phone: string,
    poolId: string
  ) => {
    const r = await postData({
      url: endpoints.LOAN_DECLINE,
      payload: { transactionId: transactionId },
    });
    if (r) {
      setData!(
        (prev): tableArray<Loan> => {
          const newResults = prev!.results.filter(
            (item) => item.transactionId !== transactionId
          );

          return { ...prev!, results: newResults };
        }
      );
      setData2!(
        (prev): tableArray<Loan> => {
          const newResults = [
            ...prev!.results,
            {
              transactionId,
              poolId,
              phone,
              amount,
              createdAt,
              approved,
              id,
              paid,
            },
          ];

          return { ...prev!, results: newResults };
        }
      );
      dispatch!({ type: "incrementDeclinedLoans" });
    }
  };

  const row = ({
    transactionId,
    poolId,
    phone,
    amount,
    createdAt,
    approved,
    id,
    paid,
  }: Loan) => {
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
          <Link href="/admin/users/[user]" as={`/admin/users/${phone}`}>
            <a className={styles.page__link}>{phone}</a>
          </Link>
        </td>
        <td>{amount}</td>
        <td>{new Date(createdAt).toLocaleString("en-US")}</td>
        {!noButton && (
          <>
            <td>
              <button
                className={loanStyles.approve}
                onClick={() =>
                  handleApproval(
                    id,
                    amount,
                    createdAt,
                    transactionId,
                    paid,
                    approved,
                    phone,
                    poolId
                  )
                }
              >
                Approve
              </button>
            </td>
            <td>
              <button
                className={loanStyles.decline}
                onClick={() =>
                  handleDecline(
                    id,
                    amount,
                    createdAt,
                    transactionId,
                    paid,
                    approved,
                    phone,
                    poolId
                  )
                }
              >
                Decline
              </button>
            </td>
          </>
        )}
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

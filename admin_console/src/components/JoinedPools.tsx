import React from "react";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import { pool } from "../interfaces";

interface Props {
  data: {
    id: number;
    joinedAt: string;
    memberId: string;
    owner: boolean;
    poolId: pool;
    sequence: number;
  }[];
}

export default function JoinedPools({ data }: Props) {
  const row = (
    {
      poolId,
      poolName,
      contributionAmount,
      joinedMember,
      totalMember,
      poolType,
      startStatus,
    }: pool,
    joinedAt: string
  ) => {
    return (
      <tr key={poolId}>
        <td>
          <Link href="/admin/pools/[pool]" as={`/admin/pools/${poolId}`}>
            <a className={styles.page__link}>{poolId}</a>
          </Link>
        </td>
        <td>{poolName}</td>
        <td>{new Date(joinedAt).toLocaleString("en-US")}</td>
        <td>{contributionAmount}</td>
        <td>{`${joinedMember} / ${totalMember}`}</td>
        <td>{poolType}</td>
        <td>{startStatus ? "Pool Started" : "Not Started"}</td>
        <td>
          <Link href="/admin/pools/[pool]" as={`/admin/pools/${poolId}`}>
            <button className={styles.settings} title="Pool Settings">
              <span className="material-icons-outlined">settings</span>
            </button>
          </Link>
        </td>
      </tr>
    );
  };

  const getRows = (
    arr: {
      id: number;
      joinedAt: string;
      memberId: string;
      owner: boolean;
      poolId: pool;
      sequence: number;
    }[]
  ) => {
    return arr.map((item) => row(item.poolId, item.joinedAt));
  };

  return (
    <table className={styles.table} cellSpacing="0">
      <thead>
        <tr className={styles.theading}>
          <td>Pool Id</td>
          <td>Pool Name</td>
          <td>Date Joined</td>
          <td>Contribution Amount</td>
          <td>No of members</td>
          <td>Pool Type</td>
          <td>Status</td>
          <td>Action</td>
        </tr>
      </thead>
      <tbody>{getRows(data)}</tbody>
    </table>
  );
}

import React from "react";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import { joinedMembers } from "../interfaces";

interface Props {
  data: joinedMembers[];
}

export default function JoinedTable({ data }: Props) {
  const row = ({ memberId, joinedAt }: joinedMembers) => {
    return (
      <tr key={memberId.phone}>
        <td>
          <img src={memberId.image} alt="profile" className={styles.image} />
        </td>
        <td>
          <Link
            href="/admin/users/[user]"
            as={`/admin/users/${memberId.phone}`}
          >
            <a className={styles.page__link}>{memberId.phone}</a>
          </Link>
        </td>
        <td>{memberId.name}</td>
        <td>{new Date(joinedAt).toLocaleString("en-US")}</td>
      </tr>
    );
  };

  const getRows = (arr: joinedMembers[]) => {
    return arr.map((item) => row(item));
  };

  return (
    <>
      <table className={styles.table} cellSpacing="0">
        <thead>
          <tr className={styles.theading}>
            <td></td>
            <td>Phone No.</td>
            <td>Name</td>
            <td>Joined At</td>
          </tr>
        </thead>
        <tbody>{getRows(data)}</tbody>
      </table>
    </>
  );
}

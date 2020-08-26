import React from "react";
import cn from "classnames";
import Link from "next/link";
import styles from "../../styles/users.module.scss";

export default function UserTable({ data, setFrom, deleteUser, from }) {
  const row = ({ no, name, date, status, members }) => {
    return (
      <tr key={no}>
        <td>{no}</td>
        <td>{name}</td>
        <td>{date}</td>
        <td>{members}</td>
        <td>{status}</td>
        <td className={styles.action}>
          <Link href="/admin/groups/[group]" as={`/admin/groups/${no}`}>
            <button className={styles.settings} title="User Settings">
              <span className="material-icons-outlined">settings</span>
            </button>
          </Link>

          <button
            className={styles.delete}
            onClick={deleteUser}
            title="Block User"
          >
            <span className="material-icons">remove_circle_outline</span>
          </button>
        </td>
      </tr>
    );
  };

  const getRows = (arr) => {
    return arr.map((item) => row(item));
  };

  return (
    <>
      <table className={styles.table} cellSpacing="0">
        <thead>
          <tr className={styles.theading}>
            <td>Group Id</td>
            <td>Name</td>
            <td>Date Created</td>
            <td>No of members</td>
            <td>Status</td>
            <td>Action</td>
          </tr>
        </thead>
        <tbody>{getRows(data)}</tbody>
      </table>

      <div className={styles.next__prev__container}>
        <button
          className={cn(styles.prev, styles.button, {
            [styles.disabled]: from === 0,
          })}
          disabled={from === 0}
          onClick={(_e) => setFrom((prev) => prev - 10)}
        >
          Previous
        </button>
        <button
          className={cn(styles.next, styles.button)}
          onClick={(_e) => setFrom((prev) => prev + 10)}
        >
          Next
        </button>
      </div>
    </>
  );
}

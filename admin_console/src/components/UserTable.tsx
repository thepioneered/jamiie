import React from "react";
import cn from "classnames";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import { user, userDetail } from "../interfaces";

interface Props {
  data: userDetail;
  pageChange: (url?: string | undefined) => Promise<void>;
  deleteUser: () => void;
}

export default function UserTable({ data, pageChange, deleteUser }: Props) {
  const row = ({ phone, name, createdAt, lastLogin }: user) => {
    return (
      <tr key={phone}>
        <td>{phone}</td>
        <td>{name}</td>
        <td>{createdAt}</td>
        <td>{lastLogin}</td>
        <td className={styles.action}>
          <Link href="/admin/users/[user]" as={`/admin/users/${phone}`}>
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

  const getRows = (arr: user[]) => {
    return arr.map((item) => row(item));
  };

  return (
    <>
      <table className={styles.table} cellSpacing="0">
        <thead>
          <tr className={styles.theading}>
            <td>Phone No.</td>
            <td>Name</td>
            <td>Date Created</td>
            <td>Last Login</td>
            <td>Action</td>
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

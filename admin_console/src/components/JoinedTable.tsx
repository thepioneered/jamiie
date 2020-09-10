import React from "react";
import Link from "next/link";
import styles from "../../styles/users.module.scss";
import { joinedMembers } from "../interfaces";

interface Props {
  data: joinedMembers[];
  owner: string;
}

export default function JoinedTable({ data, owner }: Props) {
  const row = ({ memberId, joinedAt }: joinedMembers, owner: string) => {
    let isOwner = false;
    if (memberId.phone === owner) isOwner = true;

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
        <td>
          {
            <>
              {memberId.name}
              {isOwner && <br />}
              {isOwner && <b>(Admin)</b>}
            </>
          }
        </td>
        <td>{new Date(joinedAt).toLocaleString("en-US")}</td>
        <td>{memberId.riskStatus[0].riskScore}</td>
        <td>{memberId.riskStatus[0].riskBand}</td>
      </tr>
    );
  };

  const getRows = (arr: joinedMembers[], owner: string) => {
    return arr.map((item) => row(item, owner));
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
            <td>Risk Score</td>
            <td>Risk Band</td>
          </tr>
        </thead>
        <tbody>{getRows(data, owner)}</tbody>
      </table>
    </>
  );
}

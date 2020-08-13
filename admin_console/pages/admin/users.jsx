import React from "react";
import cn from "classnames";
import { Layout, TotalCard } from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";

function Users() {
  return (
    <Layout>
      <div className={styles.User}>
        <div className={card.container}>
          <TotalCard name="Total Users" number="22544" percentage="0.4" />
          <TotalCard name="Active Users" number="46289" percentage="-1.4" />
          <TotalCard name="Logged Out Users" number="33289" percentage="0" />
        </div>
        <div className={cn(styles.container, "hover")}>
          <div className={styles.heading}>Users</div>
          <div className={styles.table__container}>
            <table className={styles.table} cellSpacing="0">
              <thead>
                <tr className={styles.theading}>
                  <td>#</td>
                  <td>Name</td>
                  <td>Date Created</td>
                  <td>Status</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1.</td>
                  <td>Paritosh</td>
                  <td>24th August 2020</td>
                  <td>Active</td>
                  <td>
                    <span
                      className="material-icons"
                      onClick={(e) => console.log("Delete")}
                    >
                      delete_outline
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Paritosh</td>
                  <td>24th August 2020</td>
                  <td>Active</td>
                  <td>
                    <span
                      className="material-icons"
                      onClick={(e) => console.log("Delete")}
                    >
                      delete_outline
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Users;

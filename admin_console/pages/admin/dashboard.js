import React from "react";
import Layout from "../../components/layout";
import { TotalCard } from "../../components";
import card from "../../styles/totalCard.module.scss";

export default function Dashboard() {
  const isSidebarOpen = true;
  const maxWidth = isSidebarOpen ? "260px" : "110px";

  return (
    <Layout>
      <div className="dashboard">
        <div
          className={card.flex__wrapper}
          style={{ maxWidth: `calc(100vw - ${maxWidth})` }}
        >
          <div className={card.container}>
            <TotalCard
              name="Total Transactions"
              number="46289"
              percentage="2.4"
            />
            <TotalCard name="Total Users" number="22544" percentage="0.4" />
            <TotalCard name="Total Groups" number="46289" percentage="-1.4" />
            <TotalCard name="Completed Pools" number="33289" percentage="0" />
          </div>
        </div>
      </div>
    </Layout>
  );
}

import React, { useState } from "react";
import Head from "next/head";
import { Header, Sidebar } from "./index";

function Layout({ children }) {
  const [isSidebarOpen, setSidebar] = useState(true);
  const [index, setIndex] = useState([
    { name: "Dashboard", icon: "dashboard", active: true },
    { name: "Server Stats", icon: "dns", active: false },
    { name: "Transactions", icon: "timeline", active: false },
    { name: "Groups", icon: "group", active: false },
    { name: "Users", icon: "person_outline", active: false },
  ]);

  const toggleSidebar = () => {
    setSidebar((prevState) => !prevState);
  };

  const changePage = (pageName) => {
    setIndex((prevState) =>
      prevState.map((item) => {
        if (item.active) item.active = !item.active;
        if (item.name === pageName) item.active = !item.active;
        return item;
      })
    );
  };

  return (
    <div className="App">
      <Head>
        <title>Admin Dashboard</title>
      </Head>

      <Header toggleSidebar={toggleSidebar} />

      <Sidebar
        isSidebarOpen={isSidebarOpen}
        index={index}
        changePage={changePage}
      />
      <main>{children}</main>
    </div>
  );
}

export default Layout;

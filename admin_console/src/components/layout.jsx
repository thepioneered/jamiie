import React, { useState, useEffect } from "react";
import Head from "next/head";
import { Header, Sidebar } from "./index";

function Layout({ children }) {
  const [isSidebarOpen, setSidebar] = useState(true);
  // useEffect(() => {
  //   checkToken();
  // }, []);

  const toggleSidebar = () => {
    setSidebar((prevState) => !prevState);
  };

  return (
    <div className="App">
      <Head>
        <title>Admin Dashboard</title>
      </Head>

      <Header toggleSidebar={toggleSidebar} />

      <Sidebar isSidebarOpen={isSidebarOpen} />
      <main>{children}</main>
    </div>
  );
}

export default Layout;

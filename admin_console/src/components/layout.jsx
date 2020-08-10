import React, { useState } from "react";
import Head from "next/head";
import { Header, Sidebar } from "./index";

function Layout({ children }) {
  const [isSidebarOpen, setSidebar] = useState(true);

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

import React, { useEffect, useContext } from "react";
import Head from "next/head";
import { Header, Sidebar, LayoutLoader } from "./index";
import { LoaderContext } from "../../pages/_app";
import { useRouter } from "next/router";

function Layout({ children }) {
  const { state, changeGlobal } = useContext(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    console.log("layout.js :)");
    if (!state.tokenValidated) router.push("/login");
  }, []);

  const toggleSidebar = () => {
    changeGlobal("isSidebarOpen");
  };

  console.log("LayoutLoader:", state);

  return (
    <div className="App">
      <Head>
        <title>Admin Dashboard</title>
      </Head>
      <Header toggleSidebar={toggleSidebar} loginData={state.loginData} />
      <Sidebar isSidebarOpen={state.isSidebarOpen} />
      {state.layoutLoader && <LayoutLoader />}
      <main>{children}</main>
    </div>
  );
}

export default Layout;

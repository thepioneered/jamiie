import React, { useEffect, useContext, ReactNode } from "react";
import Head from "next/head";
import { Header, Sidebar, LayoutLoader } from "./index";
import { LoaderContext } from "../../pages/_app";
import { useRouter } from "next/router";

interface Props {
  children: ReactNode;
}

function Layout({ children }: Props) {
  const { state, dispatch } = useContext(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    if (!state.tokenValidated) router.push("/login");
  }, []);

  const toggleSidebar = () => {
    dispatch({ type: "changeGlobal", item: "isSidebarOpen" });
  };

  if (!state.tokenValidated) {
    return null;
  }
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

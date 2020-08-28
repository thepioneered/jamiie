import React, { useState, createContext, useEffect } from "react";
import type { AppProps } from "next/app";
import Loading from "../src/components/Loading";
import checkToken from "../src/utils/checkToken";
import { useRouter } from "next/dist/client/router";
import "../styles/globals.scss";
import { globalState, globalContext } from "../src/interfaces/global";
import {
  changeGlobal,
  setLoginData,
  setTotal,
} from "../src/utils/globalFunctions";

const initialState = {
  isLoading: true,
  tokenValidated: false,
  isSidebarOpen: true,
  layoutLoader: false,
  loginData: {
    name: "admin",
    phone: "1234567890",
    email: "admin@email.com",
  },
  totalData: {
    totalTransactions: 46289,
    totalUsers: 22544,
    totalGroups: 46298,
    completedPools: 33289,
    activeUsers: 46289,
    loggedOutUsers: 33289,
  },
};

export const LoaderContext = createContext<globalContext>({
  state: initialState,
  changeGlobal,
  setLoginData,
  setTotal,
});

function MyApp({ Component, pageProps }: AppProps) {
  const router = useRouter();
  const [global, setGlobal] = useState<globalState>(initialState);

  const setToken = async () => {
    const isTokenInCookie = await checkToken();
    console.log("isToken:", isTokenInCookie);
    if (isTokenInCookie) {
      setGlobal((prevState) => {
        return {
          ...prevState,
          isLoading: false,
          tokenValidated: true,
          loginData: isTokenInCookie.data,
        };
      });
    } else {
      setGlobal((prevState) => {
        return { ...prevState, isLoading: false, tokenValidated: false };
      });
    }
  };

  const widthListenerFunc = () => {
    const size = window.outerWidth;
    if (size < 600)
      setGlobal((prevState) => {
        return { ...prevState, isSidebarOpen: false };
      });
    if (size < 1000)
      setGlobal((prevState) => {
        return { ...prevState, isSidebarOpen: false };
      });
  };

  useEffect(() => {
    console.log("useEffect in _app", router.pathname);
    widthListenerFunc();
    setToken();

    window.addEventListener("resize", widthListenerFunc);
    return () => {
      window.removeEventListener("resize", widthListenerFunc);
    };
  }, []);

  if (!global.isLoading) {
    return (
      <LoaderContext.Provider
        value={{
          state: global,
          setGlobal,
          changeGlobal,
          setLoginData,
          setTotal,
        }}
      >
        <Component {...pageProps} />
      </LoaderContext.Provider>
    );
  }
  return <Loading />;
}

export default MyApp;

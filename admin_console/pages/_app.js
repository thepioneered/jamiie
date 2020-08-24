import React, { createContext, useState, useEffect } from "react";
import { useRouter } from "next/router";
import { Loading } from "../src/components";
import checkToken from "../src/utils/checkToken";
import "../styles/globals.scss";

export const LoaderContext = createContext();

function MyApp({ Component, pageProps }) {
  const router = useRouter();
  const [global, setGlobal] = useState({
    isLoading: true,
    tokenValidated: false,
    isSidebarOpen: true,
    layoutLoader: false,
    loginData: {},
    totalData: {},
  });

  const setToken = async () => {
    // setGlobal((prevState) => {
    //   return {
    //     ...prevState,
    //     isLoading: false,
    //     tokenValidated: true,
    //     loginData: {
    //       name: "Nitish Sharma",
    //       email: "nitishrkt@gmail.com",
    //       phone: "1234567891",
    //     },
    //     totalData: {
    //       totalTransactions: 46289,
    //       totalUsers: 22544,
    //       totalGroups: 46298,
    //       completedPools: 33289,
    //       activeUsers: 46289,
    //       loggedOutUsers: 33289,
    //     },
    //   };
    // });
    const isTokenInCookie = await checkToken();
    console.log("isToken:", isTokenInCookie);
    if (isTokenInCookie) {
      setGlobal((prevState) => {
        return {
          ...prevState,
          isLoading: false,
          tokenValidated: true,
          loginData: isTokenInCookie.data,
          totalData: {
            totalTransactions: 46289,
            totalUsers: 22544,
            totalGroups: 46298,
            completedPools: 33289,
            activeUsers: 46289,
            loggedOutUsers: 33289,
          },
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

  const changeGlobal = (item) => {
    setGlobal((prevState) => {
      return { ...prevState, [item]: !prevState[item] };
    });
  };

  const setLoginData = (data) => {
    setGlobal((prevState) => {
      return { ...prevState, loginData: data };
    });
  };

  const setTotal = (key, num) => {
    setGlobal((prevState) => {
      return { ...prevState, totalData: { ...totalData, [key]: num } };
    });
  };

  if (!global.isLoading) {
    return (
      <LoaderContext.Provider
        value={{
          state: global,
          changeGlobal: changeGlobal,
          setLoginData: setLoginData,
          setTotal: setTotal,
        }}
      >
        <Component {...pageProps} />
      </LoaderContext.Provider>
    );
  }

  return <Loading />;
}

export default MyApp;

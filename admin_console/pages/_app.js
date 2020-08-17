import React, { createContext, useState, useEffect } from "react";
import { useRouter, Router } from "next/router";
import Loading from "../src/components/Loading";
import checkToken from "../src/utils/checkToken";
import "../styles/globals.scss";

export const LoaderContext = createContext();

function MyApp({ Component, pageProps }) {
  const [global, setGlobal] = useState({
    isLoading: true,
    tokenValidated: false,
    isSidebarOpen: true,
    layoutLoader: false,
    loginData: {},
  });

  const router = useRouter();
  const setToken = async () => {
    const isTokenInCookie = await checkToken();
    console.log("isToken:", isTokenInCookie);
    if (isTokenInCookie) {
      setGlobal((prevState) => {
        return { ...prevState, isLoading: false, tokenValidated: true };
      });
    } else {
      setGlobal((prevState) => {
        return { ...prevState, isLoading: false, tokenValidated: false };
      });
    }
  };

  const widthListenerFunc = () => {
    const size = window.outerWidth;
    // console.log("Heqy!!", size);
    if (size < 600)
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

  if (global.isLoading) {
    return <Loading />;
  } else {
    return (
      <LoaderContext.Provider
        value={{
          state: global,
          changeGlobal: changeGlobal,
          setLoginData: setLoginData,
        }}
      >
        <Component {...pageProps} />
      </LoaderContext.Provider>
    );
  }
}

export default MyApp;

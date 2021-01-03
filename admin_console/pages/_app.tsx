import React, { createContext, useEffect, useReducer } from "react";
import type { AppProps } from "next/app";
import Loading from "../src/components/Loading";
import { postData } from "../src/utils/apiCalls";
import { useRouter } from "next/dist/client/router";
import "../styles/globals.scss";
import {
  globalContext,
  loginData,
  globalState,
} from "../src/interfaces/global";
import { globalReducer } from "../src/utils/globalReducer";
import { endpoints } from "../src/constants/apiEndpoints";

const initialState: globalState = {
  isLoading: true,
  tokenValidated: false,
  isSidebarOpen: true,
  layoutLoader: false,
  loginData: {
    name: "admin",
    phone: "1234567890",
    email: "admin@email.com",
    totalApprovedLoans: 0,
    totalDeclinedLoans: 0,
    totalLoans: 0,
    totalTransactions: 0,
    totalUsers: 0,
    totalPools: 0,
    completedPools: 0,
  },
};

export const LoaderContext = createContext<globalContext>({
  state: initialState,
  dispatch: () => null,
});

function MyApp({ Component, pageProps }: AppProps) {
  const router = useRouter();
  const [state, dispatch] = useReducer(globalReducer, initialState);

  const setToken = async () => {
    const isTokenInCookie = await postData<loginData>({
      url: endpoints.TOKEN_CHECK,
    });
    if (isTokenInCookie)
      dispatch({ type: "checkSuccess", data: isTokenInCookie });
    else dispatch({ type: "checkFail" });
  };

  const widthListenerFunc = () => {
    const size = window.outerWidth;
    if (size < 600) dispatch({ type: "closeSidebar" });
    if (size < 1000) dispatch({ type: "closeSidebar" });
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

  if (!state.isLoading) {
    return (
      <LoaderContext.Provider
        value={{
          state,
          dispatch,
        }}
      >
        <Component {...pageProps} />
      </LoaderContext.Provider>
    );
  }
  return <Loading />;
}

export default MyApp;

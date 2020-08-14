import React, { useContext, useEffect } from "react";
import { LoaderContext } from "./_app";
import Loading from "../src/components/Loading";
import { useRouter } from "next/router";

export default function App() {
  const { state, globalState } = useContext(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    if (state.tokenValidated) router.push("/admin/dashboard");
    else router.push("/login");
  }, []);

  return <Loading />;
}

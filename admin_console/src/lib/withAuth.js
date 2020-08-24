import React, { useState, useEffect } from "react";
import Router from "next/router";
import { getCookie } from "../utils/cookies";

const withAuth = (WrappedComponent) => (props) => {
  const [isLoading, setIsLoading] = useState(true);

  const checkCsrf = () => {
    const token = getCookie("user-auth-token");
    if (!token) {
      Router.push("/");
    } else {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    checkCsrf();
  }, []);

  return isLoading ? null : <WrappedComponent {...props} />;
};

export default withAuth;

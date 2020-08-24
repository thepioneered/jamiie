import React from "react";
import { useRouter } from "next/router";
import { Layout } from "../../../src/components";

function User() {
  const router = useRouter();
  const { user } = router.query;

  return (
    <Layout>
      <h1>Post: {user}</h1>
    </Layout>
  );
}

export default User;

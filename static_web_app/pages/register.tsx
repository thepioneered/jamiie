import React, { useState } from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import styles from "../styles/register.module.scss";
import MyInput from "../src/ui/MyInput";
import MyButton from "../src/ui/MyButton";

const register = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    mobile: "",
  });
  const [wrongs, setWrongs] = useState<string[]>([]);
  const [done, setDone] = useState(false);

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (wrongs.length === 0) {
      setDone(true);
    }
  };

  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <div className={styles.container}>
        <div className={styles.heading}>Register</div>
        {done ? (
          <div>Thank you for registering!</div>
        ) : (
          <form className={styles.form} onSubmit={handleSubmit}>
            <MyInput
              formData={formData}
              label="Name"
              name="name"
              placeholder="Enter your name"
              setFormData={setFormData}
            />
            <MyInput
              formData={formData}
              label="Email"
              name="email"
              placeholder="Enter your email"
              setFormData={setFormData}
              wrongDescription="Invalid email"
              wrongs={wrongs}
              setWrongs={setWrongs}
              email
            />
            <MyInput
              formData={formData}
              label="Mobile"
              name="mobile"
              placeholder="Enter your mobile number"
              setFormData={setFormData}
              wrongDescription="Invalid mobile"
              wrongs={wrongs}
              setWrongs={setWrongs}
            />
            <MyButton text="Register" filled style={{ marginTop: "3em" }} />
          </form>
        )}
      </div>
    </>
  );
};

export default register;

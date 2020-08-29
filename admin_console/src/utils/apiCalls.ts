import { postDataWithXcsrf } from "../services/apiServices";
import { loginData } from "../interfaces";

export const checkToken = async () => {
  try {
    const r: Promise<loginData> = await postDataWithXcsrf("TOKEN_CHECK");
    console.log("checkToken Result:", r);
    return r;
  } catch (e) {
    console.log("checkToken Error:", e);
    return false;
  }
};

export const login = async (payload: { phone: string; password: string }) => {
  try {
    const r: Promise<loginData> = await postDataWithXcsrf(
      "LOGIN_ADMIN",
      payload
    );
    console.log("login Result:", r);
    return r;
  } catch (e) {
    console.log("login Error:", e);
    return false;
  }
};

import { postDataWithXcsrf } from "../services/apiServices";
import { login } from "../interfaces";

export const checkToken = async () => {
  try {
    const r: Promise<login> = await postDataWithXcsrf("TOKEN_CHECK");
    console.log("checkToken Result:", r);
    return r;
  } catch (e) {
    console.log("checkToken Error:", e);
    return false;
  }
};

export const loginAPI = async (payload: {
  phone: string;
  password: string;
}) => {
  try {
    const r: Promise<login> = await postDataWithXcsrf("LOGIN_ADMIN", payload);
    console.log("login Result:", r);
    return r;
  } catch (e) {
    console.log("login Error:", e);
    return false;
  }
};

export const logout = async () => {
  try {
    await postDataWithXcsrf("LOGOUT_ADMIN");
    return true;
  } catch (e) {
    console.log("login Error:", e);
    return false;
  }
};

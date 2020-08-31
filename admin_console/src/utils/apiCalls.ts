import {
  postDataWithXcsrf,
  fetchRestDataWithXcsrf,
} from "../services/apiServices";
import { endpoints, DOMAIN } from "../constants/apiEndpoints";
import { loginData } from "../interfaces/global";

export const checkToken = async () => {
  try {
    const r: Promise<loginData> = await postDataWithXcsrf(
      DOMAIN + endpoints.TOKEN_CHECK
    );
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
    const r: Promise<loginData> = await postDataWithXcsrf(
      DOMAIN + endpoints.LOGIN_ADMIN,
      payload
    );
    console.log("login Result:", r);
    return r;
  } catch (e) {
    console.log("login Error:", e);
    return false;
  }
};

export const logout = async () => {
  try {
    await postDataWithXcsrf(DOMAIN + endpoints.LOGOUT_ADMIN);
    return true;
  } catch (e) {
    console.log("login Error:", e);
    return false;
  }
};

export const getTableArray = async <T>(url: string) => {
  try {
    // let r: Promise<userDetail>;
    const r: Promise<T> = await fetchRestDataWithXcsrf(url);

    console.log("userArray Result:", r);
    return r;
  } catch (e) {
    console.log("userArray Error:", e);
    return false;
  }
};

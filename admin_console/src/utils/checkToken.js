import { postDataWithXcsrf } from "../services/apiServices";

async function checkToken() {
  try {
    const r = await postDataWithXcsrf("TOKEN_CHECK");
    console.log("CheckToken Result:", r);
    return true;
  } catch (e) {
    console.log("CheckToken Error:", e);
    return false;
  }
}

export default checkToken;

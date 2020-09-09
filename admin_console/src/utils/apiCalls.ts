import {
  postDataWithXcsrf,
  fetchRestDataWithXcsrf,
} from "../services/apiServices";
import { DOMAIN } from "../constants/apiEndpoints";

export const postData = async <T>({
  url,
  payload = {},
  domain = true,
}: {
  url: string;
  payload?: Object;
  domain?: boolean;
}): Promise<T | false> => {
  let endpoint: string;

  if (domain) endpoint = DOMAIN + url;
  else endpoint = url;

  try {
    const r: Promise<T> = await postDataWithXcsrf(endpoint, payload);
    console.log(`R(${url}) : `, r);
    return r;
  } catch (e) {
    console.log(`E(${url}) : `, e);
    return false;
  }
};

export const fetchData = async <T>({
  url,
  domain = true,
}: {
  url: string;
  domain?: boolean;
}): Promise<T | false> => {
  let endpoint: string;

  if (domain) endpoint = DOMAIN + url;
  else endpoint = url;

  try {
    const r: Promise<T> = await fetchRestDataWithXcsrf(endpoint);
    console.log(`R(${url}) : `, r);
    return r;
  } catch (e) {
    console.log(`E(${url}) : `, e);
    return false;
  }
};

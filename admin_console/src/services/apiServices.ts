import { AxiosInstance } from "axios";
import { httpHandler, httpXcsrfHandler } from "./httpHandlers";

// Post Function
function postOperation(
  handler: AxiosInstance,
  apiPath: string,
  dataContent: object
): Promise<any> {
  return new Promise((resolve, reject) => {
    handler
      .post(apiPath, dataContent)
      .then((res) => {
        const data = res.data;
        resolve(data);
      })
      .catch((error) => {
        reject(error.response);
      });
  });
}

// Fetch Function
function fetchOperation(handler: AxiosInstance, apiPath: string): Promise<any> {
  return new Promise((resolve, reject) => {
    handler
      .get(apiPath)
      .then((res) => {
        const data = res.data;
        resolve(data);
      })
      .catch((error) => {
        reject(error.response);
      });
  });
}

// Fetching with cookies
export const fetchRestDataWithXcsrf = (apiRoute: string) =>
  fetchOperation(httpXcsrfHandler(), apiRoute);

// Post req without cookies
export const postData = (apiRoute: string, dataContent: object = {}) =>
  postOperation(httpHandler(), apiRoute, dataContent);

// Post req with cookies
export const postDataWithXcsrf = (apiRoute: string, dataContent: object = {}) =>
  postOperation(httpXcsrfHandler(), apiRoute, dataContent);

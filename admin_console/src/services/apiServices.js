import apiCalls from "../constants/apiEndpoints";
import { httpHandler, httpXcsrfHandler } from "./httpHandlers";
import logoutUser from "../utils/logoutUser";

export const API_ENDPOINT = "https://jamiieapi.herokuapp.com";

const logout = (status) => {
  if (status === 401) {
    logoutUser();
  }
};

export function fetchOperation(
  handler,
  apiPath,
  config = {},
  apiRoute,
  domain = API_ENDPOINT
) {
  return new Promise((resolve, reject) => {
    handler
      .get(domain + apiPath, config)
      .then((res) => {
        const data =
          typeof res.data.data !== "undefined" ? res.data.data : res.data;
        resolve(data);
      })
      .catch((error) => {
        if (error?.response?.status) {
          logout(error.response.status);
        }
        reject(error.response);
      });
  });
}

function postOperation(handler, apiPath, dataContent, domain = API_ENDPOINT) {
  return new Promise((resolve, reject) => {
    handler
      .post(domain + apiPath, dataContent)
      .then((res) => {
        // const data =
        //   typeof res.data.data !== "undefined" ? res.data.data : res.data;
        resolve(res);
      })
      .catch((error) => {
        // logout(error.response.status);
        reject(error.response);
      });
  });
}

export const fetchData = (apiRoute, queryParams) =>
  fetchOperation(httpHandler(), apiCalls[apiRoute], queryParams, apiRoute);

export const fetchRestData = (apiRoute, customPath, queryParams) => {
  let endPointParameterised = apiCalls[apiRoute];
  Object.keys(customPath.params).forEach((a) => {
    endPointParameterised = endPointParameterised.replace(
      `:${a}`,
      customPath.params[a]
    );
  });
  return fetchOperation(
    httpHandler(),
    endPointParameterised,
    queryParams,
    apiRoute
  );
};

export const fetchDataWithXcsrf = (apiRoute, dataContent) =>
  fetchOperation(httpXcsrfHandler(), apiCalls[apiRoute], dataContent, apiRoute);

export const fetchRestDataWithXcsrf = (apiRoute, customPath, queryParams) => {
  let endPointParameterised = apiCalls[apiRoute];
  Object.keys(customPath.params).forEach((a) => {
    endPointParameterised = endPointParameterised.replace(
      `:${a}`,
      customPath.params[a]
    );
  });
  return fetchOperation(
    httpXcsrfHandler(),
    endPointParameterised,
    queryParams,
    apiRoute
  );
};

export const postData = (apiRoute, dataContent) =>
  postOperation(httpHandler(), apiCalls[apiRoute], dataContent);

export const postDataWithXcsrf = (apiRoute, dataContent) =>
  postOperation(httpXcsrfHandler(), apiCalls[apiRoute], dataContent);

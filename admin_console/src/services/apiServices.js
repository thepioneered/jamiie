import apiCalls from "../constants/apiEndpoints";
import { httpHandler, httpXcsrfHandler } from "./httpHandlers";

export const API_ENDPOINT = "https://jamiieapi.herokuapp.com";

function postOperation(handler, apiPath, dataContent, domain = API_ENDPOINT) {
  return new Promise((resolve, reject) => {
    handler
      .post(domain + apiPath, dataContent)
      .then((res) => {
        resolve(res);
      })
      .catch((error) => {
        reject(error.response);
      });
  });
}

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

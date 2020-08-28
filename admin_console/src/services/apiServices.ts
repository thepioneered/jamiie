import { AxiosInstance } from "axios";
import apiCalls from "../constants/apiEndpoints";
import { httpHandler, httpXcsrfHandler } from "./httpHandlers";
import { endpoints } from "../interfaces";

export const API_ENDPOINT = "https://jamiieapi.herokuapp.com";

function postOperation(
  handler: AxiosInstance,
  apiPath: string,
  dataContent: object,
  domain = API_ENDPOINT
): Promise<any> {
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

// export const fetchRestDataWithXcsrf = (apiRoute:endpoints, customPath, queryParams) => {
//   let endPointParameterised = apiCalls[apiRoute];
//   Object.keys(customPath.params).forEach((a) => {
//     endPointParameterised = endPointParameterised.replace(
//       `:${a}`,
//       customPath.params[a]
//     );
//   });
//   return fetchOperation(
//     httpXcsrfHandler(),
//     endPointParameterised,
//     queryParams,
//     apiRoute
//   );
// };

export const postData = (apiRoute: endpoints, dataContent: object = {}) =>
  postOperation(httpHandler(), apiCalls[apiRoute], dataContent);

export const postDataWithXcsrf = (
  apiRoute: endpoints,
  dataContent: object = {}
) => postOperation(httpXcsrfHandler(), apiCalls[apiRoute], dataContent);

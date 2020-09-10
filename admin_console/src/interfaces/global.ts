import { Actions } from "../utils/globalReducer";

export type loginData = {
  name: string;
  phone: string;
  email: string;
};

export type totalData = {
  totalTransactions: number;
  totalUsers: number;
  totalPools: number;
  completedPools: number;
};

export type globalStateProperties =
  | "isLoading"
  | "tokenValidated"
  | "layoutLoader"
  | "loginData"
  | "totalData"
  | "isSidebarOpen";

export type totalDataProperties =
  | "totalTransactions"
  | "totalUsers"
  | "totalGroups"
  | "completedPools"
  | "activeUsers"
  | "loggedOutUsers";

export type globalState = {
  isLoading: boolean;
  tokenValidated: boolean;
  isSidebarOpen: boolean;
  layoutLoader: boolean;
  loginData: loginData;
  totalData: totalData;
};

export type globalContext = {
  state: globalState;
  dispatch?: React.Dispatch<Actions>;
};

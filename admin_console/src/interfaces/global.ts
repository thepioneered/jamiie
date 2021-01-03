import { Actions } from "../utils/globalReducer";

export type loginData = {
  name: string;
  phone: string;
  email: string;
  totalApprovedLoans: number;
  totalDeclinedLoans: number;
  totalLoans: number;
  totalPools: number;
  totalTransactions: number;
  totalUsers: number;
  completedPools: number;
};

export type globalStateProperties =
  | "isLoading"
  | "tokenValidated"
  | "layoutLoader"
  | "loginData"
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
};

export type globalContext = {
  state: globalState;
  dispatch: React.Dispatch<Actions>;
};

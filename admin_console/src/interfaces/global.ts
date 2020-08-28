export type LoginData = {
  name: string;
  phone: string;
  email: string;
};

export type TotalData = {
  totalTransactions: number;
  totalUsers: number;
  totalGroups: number;
  completedPools: number;
  activeUsers: number;
  loggedOutUsers: number;
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

export interface globalState {
  isLoading: boolean;
  tokenValidated: boolean;
  isSidebarOpen: boolean;
  layoutLoader: boolean;
  loginData: LoginData;
  totalData: TotalData;
}

export type globalContext = {
  state: globalState;
  setGlobal?: React.Dispatch<React.SetStateAction<globalState>>;
  changeGlobal: (
    item: globalStateProperties,
    setGlobal: React.Dispatch<React.SetStateAction<globalState>>
  ) => void;
  setLoginData: (
    data: LoginData,
    setGlobal: React.Dispatch<React.SetStateAction<globalState>>
  ) => void;
  setTotal: (
    key: totalDataProperties,
    num: number,
    setGlobal: React.Dispatch<React.SetStateAction<globalState>>
  ) => void;
};

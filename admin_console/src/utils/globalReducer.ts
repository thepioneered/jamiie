import {
  globalState,
  globalStateProperties,
  loginData,
} from "../interfaces/global";

export type Actions =
  | {
      type: "changeGlobal";
      item: globalStateProperties;
    }
  | {
      type: "setLoginData";
      data: loginData;
    }
  | {
      type: "checkSuccess";
      data: loginData;
    }
  | {
      type: "checkFail";
    }
  | {
      type: "closeSidebar";
    }
  | {
      type: "incrementApprovedLoans";
    }
  | {
      type: "incrementDeclinedLoans";
    };

export const globalReducer = (state: globalState, action: Actions) => {
  switch (action.type) {
    case "changeGlobal":
      return { ...state, [action.item]: !state[action.item] };
    case "setLoginData":
      return { ...state, loginData: action.data };
    case "checkSuccess":
      return {
        ...state,
        isLoading: false,
        tokenValidated: true,
        loginData: action.data,
      };
    case "checkFail":
      return { ...state, isLoading: false, tokenValidated: false };
    case "closeSidebar":
      return { ...state, isSidebarOpen: false };
    case "incrementApprovedLoans":
      return {
        ...state,
        loginData: {
          ...state.loginData,
          totalApprovedLoans: state.loginData.totalApprovedLoans + 1,
        },
      };
    case "incrementDeclinedLoans":
      return {
        ...state,
        loginData: {
          ...state.loginData,
          totalDeclinedLoans: state.loginData.totalDeclinedLoans + 1,
        },
      };
  }
};

import {
  globalState,
  globalStateProperties,
  loginData,
  totalDataProperties,
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
      type: "setTotalData";
      key: totalDataProperties;
      num: number;
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
    };

export const globalReducer = (state: globalState, action: Actions) => {
  switch (action.type) {
    case "changeGlobal":
      return { ...state, [action.item]: !state[action.item] };
    case "setLoginData":
      return { ...state, loginData: action.data };
    case "setTotalData":
      return {
        ...state,
        totalData: { ...state.totalData, [action.key]: action.num },
      };
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
  }
};

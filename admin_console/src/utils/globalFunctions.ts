import {
  LoginData,
  globalState,
  globalStateProperties,
  totalDataProperties,
} from "../interfaces/global";

export const changeGlobal = (
  item: globalStateProperties,
  setGlobal: React.Dispatch<React.SetStateAction<globalState>>
) => {
  setGlobal((prevState) => {
    return { ...prevState, [item]: !prevState[item] };
  });
};

export const setLoginData = (
  data: LoginData,
  setGlobal: React.Dispatch<React.SetStateAction<globalState>>
) => {
  setGlobal((prevState) => {
    return { ...prevState, loginData: data };
  });
};

export const setTotal = (
  key: totalDataProperties,
  num: number,
  setGlobal: React.Dispatch<React.SetStateAction<globalState>>
) => {
  setGlobal((prevState) => {
    return { ...prevState, totalData: { ...prevState.totalData, [key]: num } };
  });
};

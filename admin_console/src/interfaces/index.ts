// You can include shared interfaces/types in a separate file
// and then use them in any component by importing them. For
// example, to import the interface below do:
//
// import User from 'path/to/interfaces';

export type endpoints = "LOGIN_ADMIN" | "LOGOUT_ADMIN" | "TOKEN_CHECK";

export type login = {
  data: { name: string; phone: string; email: string };
};

export type userArray = {
  img: string;
  phone: string;
  name: string;
  email: string;
  dateCreated: string;
  lastLogin: string;
}[];

export type user = {
  img: string;
  name: string;
  email: string;
  mobile: string;
  riskScore: string;
  riskBand: string;
  state: string;
  city: string;
  dateCreated: string;
  lastLogin: string;
  jobAge: string;
  family: string;
  age: string;
  savingMoney: string;
  loans: string;
  living: string;
};

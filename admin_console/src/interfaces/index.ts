export type user = {
  img: string;
  phone: string;
  name: string;
  email: string;
  createdAt: any;
  lastLogin: any;
};

export type userFull = {
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

export type userDetail = {
  count: number;
  next: string | null;
  previous: string | null;
  results: user[];
};

// ------------
// table Array
// ------------

export type tableArray<t> = {
  count: number;
  next: string | null;
  previous: string | null;
  results: t[];
};

// ------------
// User types
// ------------

export type user = {
  img: string;
  phone: string;
  name: string;
  email: string;
  createdAt: string;
  lastLogin: string;
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

// ------------
// pool types
// ------------

export type pool = {
  poolId: string;
  poolName: string;
  contributionAmount: number;
  joinedMember: number;
  poolType: string;
  totalMember: number;
};

export type poolFull = {
  poolId: string;
  poolName: string;
  poolOwner: string;
  contributionAmount: number;
  joinedMember: number;
  poolType: string;
  totalMember: number;
};

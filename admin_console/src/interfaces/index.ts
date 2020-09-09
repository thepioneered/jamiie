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
  image: string;
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

const asdf = {
  contributionAmount: 200,
  createdAt: "2020-09-09T06:14:15.251333Z",
  joinedMember: 2,
  poolId: "0ced5009",
  poolName: "abc",
  poolType: "Monthly",
  startStatus: false,
  totalMember: 12,
};

export type pool = {
  contributionAmount: number;
  createdAt: string;
  joinedMember: number;
  poolId: string;
  poolName: string;
  poolType: string;
  startStatus: boolean;
  totalMember: number;
};

export type joinedMembers = {
  id: number;
  memberId: {
    image: string;
    phone: string;
    name: string;
    riskStatus: [
      {
        phone: string;
        jobAge: string;
        family: string;
        poolingRecord: string;
        savingReason: string;
        riskScore: number;
        riskBand: string;
      }
    ];
  };
  joinedAt: string;
  poolId: string;
};

export type poolFull = {
  poolId: string;
  poolOwner: string;
  poolName: string;
  contributionAmount: number;
  joinedMember: number;
  poolType: string;
  totalMember: number;
  createdAt: string;
  deadline: string;
  joinedpool: joinedMembers[];
  startStatus: boolean;
  completeStatus: boolean;
};

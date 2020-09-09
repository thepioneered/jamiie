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
  phone: string;
  name: string;
  image: string;
  email: string;
  state: string;
  city: string;
  createdAt: string;
  lastLogin: string;
  DOB: string;
  riskScore: number;
  jobAge: string;
  family: string;
  poolingRecord: string;
  repaymentRecord: string;
  riskBand: string;
  savingReason: string;
};

// ------------
// pool types
// ------------

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

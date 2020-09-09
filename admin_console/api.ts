// TODO: User Page - Created pools, joined pools, transactions?

// userArray for userTable
export const userArray = {
  users: [
    {
      img: "",
      phone: "12934876",
      name: "Paritosh",
      email: "batishparitosh2@gmail.com",
      dateCreated: "date",
      lastLogin: "date",
    },
    {
      img: "",
      phone: "12934876",
      name: "Paritosh",
      email: "batishparitosh2@gmail.com",
      dateCreated: "date",
      lastLogin: "date",
    },
  ],
};

// user json for single user
export const user = {
  img: "",
  name: "Paritosh Batish",
  email: "batishparitosh2@gmail.com",
  mobile: "8146990621",
  riskScore: "54",
  riskBand: "Moderate",
  state: "PUnjab",
  city: "Chandigarh",
  dateCreated: "20th Aug 2020",
  lastLogin: "6th Sept. 2020 4:40pm",
  jobAge: "Upto 4 years",
  family: "Single with Children",
  age: "<25 Years",
  savingMoney: "2-3",
  loans: "1 on no loan",
  living: "3",
};

// pool array for pool table
export const poolArray = {
  pools: [
    {
      no: "8be74eg1",
      name: "Paritosh",
      amount: "100",
      date: "24th August 2020",
      status: "started",
      members: "15 / 15",
    },
    {
      no: "8be74eg2",
      name: "Paritosh",
      amount: "100",
      date: "24th August 2020",
      status: "not started",
      members: "12 / 15",
    },
  ],
};

// pool - single pool info
export const pool = {
  poolId: "05797de5",
  poolOwner: "+917071006000",
  poolName: "uffi",
  contributionAmount: 68,
  joinedMember: 1,
  poolType: "Weekly",
  totalMember: 9,
  createdAt: "2020-08-29T10:03:02.105398Z",
  deadline: "2020-09-09",
  joinedpool: [
    {
      id: 10,
      memberId: {
        image:
          "https://jamiie-userprofile-images.s3.amazonaws.com/ProfileImages/917071006000.jpg",
        phone: "+917071006000",
        name: "Nakul Garg",
      },
      joinedAt: "2020-08-29T10:03:02.109723Z",
      poolId: "05797de5",
    },
  ],
};

// ------------
// App api's
// ------------

// If status false pool not Started
// get: {poolID: ""}
export const pool_app = {
  poolId: "",
  poolName: "Paritosh's Pool",
  contributionAmount: "580",
  dateCreated: "24th August 2020",
  deadline: "3/1/2020, 12:00:00 AM",
  poolType: "Weekly",
  totalMember: 4,
  joinedMember: 2,
  status: false,
  poolMembers: [
    {
      img: "",
      phone: "12934876",
      name: "Paritosh",
      riskScore: "54",
      riskBand: "Moderate",
    },
    {
      img: "",
      phone: "12934876",
      name: "Paritosh",
      riskScore: "54",
      riskBand: "Moderate",
    },
  ],
};

// post: /pool/start, {poolId: ""}
export const pool_order = {
  users: [
    {
      userID: "",
      order: 1,
    },
    {
      userID: "",
      order: 2,
    },
    {
      userID: "",
      order: 3,
    },
  ],
};

export const pool_app_started = {};

export type Pool = {
  no: string;
  name: string;
  date: string;
  status: string;
  members: number;
};

export type Transaction = {
  id: number;
  amount: string;
  paidTime: string;
  transactionUrl: string;
  transactionStatus: boolean;
  lateTransactionStatus: boolean;
  payDate: null;
  poolId: string;
  phone: string;
};

export type Loan = {
  id: number;
  amount: number;
  createdAt: string;
  transactionId: string;
  paid: boolean;
  approved: boolean;
  user: string;
  poolId: string;
};

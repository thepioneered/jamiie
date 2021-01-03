export const DOMAIN = "https://jamiie.anukai.com";

export enum endpoints {
  LOGIN_ADMIN = "/userauth/adminlogin",
  LOGOUT_ADMIN = "/userauth/adminlogout",
  TOKEN_CHECK = "/userauth/check",
  USER_DETAILS = "/userauth/usersdetail",
  SINGLE_USER = "/userauth/singleuserdetail/",
  POOL_DETAILS = "/pool/pooldetails",
  SINGLE_POOL = "/pool/adminsinglepool/",
  LOAN_REQUEST_LIST = "/payments/loanrequests",
  LOAN_DECLINED_LIST = "/payments/loandeclinedlist",
  LOAN_PAID_LIST = "/payments/loanpaidlist",
  LOAN_NOT_PAID_LIST = "/payments/loannotpaidlist",
  LOAN_APPROVAL = "/payments/loanapproval",
  LOAN_DECLINE = "/payments/loandeclined",
  TRANSACTIONS = "/payments/transactions",
  SINGLE_TRANSACTION = "/payments/transactiondetail",
}

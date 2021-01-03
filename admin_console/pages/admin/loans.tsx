import React, { useState, useContext, useEffect } from "react";
import cn from "classnames";
import { LoaderContext } from "../_app";
import {
  Layout,
  TotalCard,
  GlobalLoader,
  LoanTable,
} from "../../src/components";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/users.module.scss";
import { fetchData } from "../../src/utils/apiCalls";
import { tableArray } from "../../src/interfaces";
import { endpoints } from "../../src/constants/apiEndpoints";
import { Loan } from "../../src/interfaces/tables";

function Loans() {
  const { state, dispatch } = useContext(LoaderContext);

  const [data, setData] = useState<tableArray<Loan> | null>(null);
  const [data2, setData2] = useState<tableArray<Loan> | null>(null);
  const [data3, setData3] = useState<tableArray<Loan> | null>(null);
  const [data4, setData4] = useState<tableArray<Loan> | null>(null);

  const [isLoading, setLoading] = useState(true);
  const [isLoading2, setLoading2] = useState(true);
  const [isLoading3, setLoading3] = useState(true);
  const [isLoading4, setLoading4] = useState(true);

  const getData = async (url?: string) => {
    setLoading(true);

    let r: tableArray<Loan> | false;
    if (url) r = await fetchData<tableArray<Loan>>({ url, domain: false });
    else
      r = await fetchData<tableArray<Loan>>({
        url: endpoints.LOAN_REQUEST_LIST,
      });

    if (r) {
      setData(r);
      setLoading(false);
    }
  };
  const getData2 = async (url?: string) => {
    setLoading2(true);

    let r: tableArray<Loan> | false;
    if (url) r = await fetchData<tableArray<Loan>>({ url, domain: false });
    else
      r = await fetchData<tableArray<Loan>>({
        url: endpoints.LOAN_NOT_PAID_LIST,
      });

    if (r) {
      setData2(r);
      setLoading2(false);
    }
  };
  const getData3 = async (url?: string) => {
    setLoading3(true);

    let r: tableArray<Loan> | false;
    if (url) r = await fetchData<tableArray<Loan>>({ url, domain: false });
    else
      r = await fetchData<tableArray<Loan>>({ url: endpoints.LOAN_PAID_LIST });

    if (r) {
      setData3(r);
      setLoading3(false);
    }
  };
  const getData4 = async (url?: string) => {
    setLoading4(true);

    let r: tableArray<Loan> | false;
    if (url) r = await fetchData<tableArray<Loan>>({ url, domain: false });
    else
      r = await fetchData<tableArray<Loan>>({
        url: endpoints.LOAN_DECLINED_LIST,
      });

    if (r) {
      setData4(r);
      setLoading4(false);
    }
  };

  useEffect(() => {
    getData();
    getData2();
    getData3();
    getData4();
  }, []);

  const search = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
  };

  return (
    <Layout>
      <div className={styles.user__container}>
        <div className={styles.User}>
          <div className={card.container}>
            <TotalCard name="Total Loans" number={state.loginData.totalPools} />
            <TotalCard
              name="Total Approved Loans"
              number={state.loginData.totalApprovedLoans}
            />
            <TotalCard
              name="Total Declined Loans"
              number={state.loginData.totalDeclinedLoans}
            />
          </div>
          <div className={cn(styles.container, "hover")}>
            <div className={styles.heading}>
              <div className={styles.heading__title}>
                Loans <span>Management</span>
              </div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={styles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(styles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading ? (
                <GlobalLoader />
              ) : data!.results.length ? (
                <LoanTable
                  data={data!}
                  setData={setData}
                  setData2={setData4}
                  setData3={setData2}
                  dispatch={dispatch}
                  pageChange={getData}
                />
              ) : (
                <div className={styles.empty__table}>No Loans Requested.</div>
              )}
            </div>
          </div>
          <div
            className={cn(styles.container, "hover")}
            style={{ marginTop: "2em" }}
          >
            <div className={styles.heading}>
              <div className={styles.heading__title}>
                Not Paid <span>Loans</span>
              </div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={styles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(styles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading2 ? (
                <GlobalLoader />
              ) : data2!.results.length ? (
                <LoanTable data={data2!} pageChange={getData2} noButton />
              ) : (
                <div className={styles.empty__table}>
                  All Loans have been Paid.
                </div>
              )}
            </div>
          </div>
          <div
            className={cn(styles.container, "hover")}
            style={{ marginTop: "2em" }}
          >
            <div className={styles.heading}>
              <div className={styles.heading__title}>
                Payed <span>Loans</span>
              </div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={styles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(styles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading3 ? (
                <GlobalLoader />
              ) : data3!.results.length ? (
                <LoanTable data={data3!} pageChange={getData3} noButton />
              ) : (
                <div className={styles.empty__table}>
                  No Loans have been payed.
                </div>
              )}
            </div>
          </div>
          <div
            className={cn(styles.container, "hover")}
            style={{ marginTop: "2em" }}
          >
            <div className={styles.heading}>
              <div className={styles.heading__title}>
                Declined <span>Loans</span>
              </div>
              <form
                className={styles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={styles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={styles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(styles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading4 ? (
                <GlobalLoader />
              ) : data4!.results.length ? (
                <LoanTable data={data4!} pageChange={getData4} noButton />
              ) : (
                <div className={styles.empty__table}>No Loans Declined.</div>
              )}
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}

export default Loans;

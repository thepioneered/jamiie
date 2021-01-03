import React, { useState, useEffect } from "react";
import cn from "classnames";
import { useRouter } from "next/router";
import { Layout, Modal, GlobalLoader } from "../../../src/components";
import styles from "../../../styles/[user].module.scss";
import userStyles from "../../../styles/users.module.scss";
import { userFull } from "../../../src/interfaces";
import { endpoints } from "../../../src/constants/apiEndpoints";
import { fetchData } from "../../../src/utils/apiCalls";
import CreatedPools from "../../../src/components/CreatedPools";
import JoinedPools from "../../../src/components/JoinedPools";

function User() {
  const router = useRouter();
  const { user } = router.query;

  const [showModal, toggleModal] = useState(false);
  const [data, setData] = useState<userFull | null>(null);
  const [isLoading, setLoading] = useState(true);

  const getData = async () => {
    setLoading(true);
    const r = await fetchData<userFull>({
      url: endpoints.SINGLE_USER + user + "/",
    });

    if (r) {
      setData(r);
      setLoading(false);
    }
  };

  const deleteUser = () => {
    toggleModal(true);
  };
  const closeModal = () => {
    toggleModal(false);
  };
  const search = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
  };

  useEffect(() => {
    getData();
  }, []);

  return (
    <Layout>
      <div className={styles.outer__container}>
        <div className={styles.container}>
          <div className={styles.heading__container}>
            <button
              className={styles.back__button}
              onClick={(_e) => router.back()}
            >
              <span className="material-icons">keyboard_backspace</span>
            </button>
            <h2 className={styles.heading}>User Id: {user}</h2>
          </div>
          <div
            className={cn(styles.card, "hover", {
              loading__container: isLoading,
            })}
          >
            {isLoading ? (
              <GlobalLoader />
            ) : (
              <>
                <div className={styles.picture}>
                  <img src={data?.image} alt="Profile" />
                </div>
                <div className={styles.table__container}>
                  <table className={styles.table}>
                    <tbody>
                      <tr>
                        <th>Name:</th>
                        <td>{data?.name}</td>
                      </tr>
                      <tr>
                        <th>Email:</th>
                        <td>{data?.email}</td>
                      </tr>
                      <tr>
                        <th>Mobile:</th>
                        <td>{data?.phone}</td>
                      </tr>
                      <tr>
                        <th>Risk Score:</th>
                        <td>{data?.riskScore}</td>
                      </tr>
                      <tr>
                        <th>Risk Band:</th>
                        <td>{data?.riskBand}</td>
                      </tr>
                      <tr>
                        <th>State:</th>
                        <td>{data?.state}</td>
                      </tr>
                      <tr>
                        <th>City:</th>
                        <td>{data?.city}</td>
                      </tr>
                      <tr>
                        <th>Date Created:</th>
                        <td>
                          {new Date(data!.createdAt).toLocaleDateString(
                            "en-US"
                          )}
                        </td>
                      </tr>
                      <tr>
                        <th>Last Login:</th>
                        <td>
                          {new Date(data!.lastLogin).toLocaleDateString(
                            "en-US"
                          )}
                        </td>
                      </tr>
                      <tr>
                        <th>Job Age:</th>
                        <td>{data?.jobAge}</td>
                      </tr>
                      <tr>
                        <th>Family:</th>
                        <td>{data?.family}</td>
                      </tr>
                      <tr>
                        <th>Age:</th>
                        <td>{data?.DOB}</td>
                      </tr>
                      <tr>
                        <th>Saving Reason:</th>
                        <td>{data?.savingReason} </td>
                      </tr>
                      <tr>
                        <th>Pooling Record:</th>
                        <td>{data?.poolingRecord}</td>
                      </tr>
                      <tr>
                        <th>Repayment Record:</th>
                        <td>{data?.repaymentRecord}</td>
                      </tr>
                      <tr>
                        <th>Block User:</th>
                        <td>
                          <button
                            className={styles.block__user}
                            onClick={deleteUser}
                          >
                            Block User
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </>
            )}
          </div>
          <div
            className={cn(userStyles.container, "hover")}
            style={{ margin: "2rem 0 0 0" }}
          >
            <div className={userStyles.heading}>
              <div className={userStyles.heading__title}>
                Joined <span>Pools</span>
              </div>
              <form
                className={userStyles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={userStyles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={userStyles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(userStyles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading ? (
                <GlobalLoader />
              ) : data!.createdPool.length ? (
                <CreatedPools data={data!.createdPool} />
              ) : (
                <div className={styles.empty__table}>No pools created</div>
              )}
            </div>
          </div>
          <div
            className={cn(userStyles.container, "hover")}
            style={{ margin: "2rem 0 0 0" }}
          >
            <div className={userStyles.heading}>
              <div className={userStyles.heading__title}>
                Joined <span>Pools</span>
              </div>
              <form
                className={userStyles.searchbar}
                onSubmit={search}
                method="POST"
              >
                <input
                  type="text"
                  className={userStyles.input}
                  placeholder="Search by Pool ID"
                  required={true}
                />
                <button className={userStyles.search__button}>
                  <span className={"material-icons"}>search</span>
                </button>
              </form>
            </div>
            <div
              className={cn(userStyles.table__container, {
                loading__container: isLoading,
              })}
            >
              {isLoading ? (
                <GlobalLoader />
              ) : data!.joinedPool.length ? (
                <JoinedPools data={data!.joinedPool} />
              ) : (
                <div className={styles.empty__table}>No pools joined</div>
              )}
            </div>
          </div>
        </div>
      </div>
      <Modal
        show={showModal}
        onClose={closeModal}
        header={"Are you sure that you want to block this user?"}
      >
        <div className={userStyles.note}>
          <b>Note:</b> The user cannot be blocked if he/she has already joined
          pool that has started.
        </div>
        <button className={userStyles.block__user}>Block User</button>
        <button className={userStyles.cancel}>Cancel</button>
      </Modal>
    </Layout>
  );
}

export default User;

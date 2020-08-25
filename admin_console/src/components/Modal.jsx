import React from "react";
import styles from "../../styles/modal.module.scss";

export default function Modal(props) {
  const onClose = (e) => {
    props.onClose && props.onClose(e);
  };
  if (!props.show) {
    return null;
  }
  return (
    <>
      <div className={styles.backdrop} onClick={onClose} />
      <div className={styles.modal} id="modal">
        <div className={styles.header__container}>
          <span>{props.header}</span>
          <button className={styles.close__button} onClick={onClose}>
            <span className="material-icons">close</span>
          </button>
        </div>
        <div className={styles.content}>{props.children}</div>
      </div>
    </>
  );
}

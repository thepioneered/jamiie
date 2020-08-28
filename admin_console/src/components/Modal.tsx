import React, { ReactNode } from "react";
import styles from "../../styles/modal.module.scss";

interface Props {
  children: ReactNode;
  show: boolean;
  header: string;
  onClose: () => void;
}

export default function Modal({ children, show, header, onClose }: Props) {
  const close = () => {
    onClose();
  };
  if (!show) {
    return null;
  }
  return (
    <>
      <div className={styles.backdrop} onClick={onClose} />
      <div className={styles.modal} id="modal">
        <div className={styles.header__container}>
          <span>{header}</span>
          <button className={styles.close__button} onClick={close}>
            <span className="material-icons">close</span>
          </button>
        </div>
        <div className={styles.content}>{children}</div>
      </div>
    </>
  );
}

import React from "react";

export default function Modal(props) {
  const onClose = (e) => {
    props.onClose && props.onClose(e);
  };
  if (!props.show) {
    return null;
  }
  return (
    <>
      <style jsx>{`
        .modal {
          width: 300px;
          background: white;
          border: 1px solid #ccc;
          transition: 1.1s ease-out;
          position: absolute;
          left: 50%;
          top: 50%;
          z-index: 2;
          transform: translateX(-50%) translateY(-50%);
        }
        .backdrop {
          width: 100%;
          height: 100%;
          opacity: 0.3;
          background: grey;
          position: absolute;
          top: 0;
          left: 0;
          z-index: 1;
        }
        .header-container {
          border-bottom: 1px solid #ccc;
          padding: 1rem;
          margin: 0;
          display: flex;
          justify-content: space-between;
          align-items: center;
          font-size: 24px;
        }
        .modal .content {
          padding: 1rem;
          height: 400px;
          overflow-y: scroll;
        }
        .close-icon {
          cursor: pointer;
          position: relative;
          top: -1px;
        }
      `}</style>
      <div className="backdrop" onClick={onClose} />
      <div className="modal" id="modal">
        <div className="header-container">
          <span>{props.header}</span>
          <span className="close-icon" onClick={onClose}>
            x
          </span>
        </div>
        <div className="content">{props.children}</div>
      </div>
    </>
  );
}

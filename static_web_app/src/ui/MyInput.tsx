import React, { useEffect, useState } from "react";
import type { dynamicForm } from "../interfaces/";
import cn from "classnames";
import styles from "../../styles/ui/myinput.module.scss";

interface MyInputProps<T> {
  name: keyof T & string;
  label: string;
  wrongDescription?: string;
  formData: dynamicForm & T;
  setFormData: React.Dispatch<React.SetStateAction<T>>;
  wrongs?: string[];
  setWrongs?: React.Dispatch<React.SetStateAction<string[]>>;
  placeholder: string;
  type?: "text" | "number" | "email";
  pattern?: RegExp;
  notRequired?: boolean;
  style?: React.CSSProperties | undefined;
  onBlur?: () => void;
  number?: boolean;
  email?: boolean;
  phone?: boolean;
  maxLength?: number;
  outerClassName?: string;
}

const MyInput = <T,>({
  name,
  label,
  wrongDescription = "",
  formData,
  setFormData,
  wrongs,
  setWrongs,
  style,
  placeholder,
  type = "text",
  pattern = /.*/,
  maxLength = 524288,
  notRequired = false,
  onBlur,
  number = false,
  email = false,
  phone = false,
  outerClassName,
}: MyInputProps<T>) => {
  const [wrong, setWrong] = useState(false);

  useEffect(() => {
    if (wrongs && wrongs.indexOf(name) !== -1) setWrong(true);
  }, []);

  if (number) type = "number";
  if (email) {
    pattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    type = "email";
  }

  return (
    <div>
      <div className={cn(styles.container, outerClassName)} style={style}>
        <label
          htmlFor="input"
          className={cn(styles.label, { [styles.label__wrong]: wrong })}
        >
          {label}
        </label>
        <div className={styles.phone__container}>
          {phone && <div className={styles.phone}>+91</div>}
          <input
            type={type}
            name={name}
            placeholder={placeholder}
            maxLength={maxLength}
            className={cn(styles.input, {
              [styles.input__wrong]: wrong,
              [styles.input__phone]: phone,
            })}
            required={!notRequired}
            value={formData[name]}
            onChange={(e) => {
              const newValue = e.target.value;
              if (maxLength && newValue.length <= maxLength) {
                setFormData((prev: T) => {
                  return { ...prev, [name]: newValue };
                });
              }
            }}
            onBlur={
              onBlur
                ? onBlur
                : (e) => {
                    const myValue = e.target.value;
                    if (pattern) {
                      if (myValue.match(pattern) === null) {
                        if (!wrong) {
                          setWrong(true);
                          setWrongs!(wrongs!.concat(name));
                        }
                      } else if (wrong) {
                        setWrong(false);
                        setWrongs!(wrongs!.filter((item) => item !== name));
                      }
                    }
                  }
            }
          />
        </div>
      </div>
      <div className={cn(styles.wrong, { [styles.wrong__show]: wrong })}>
        {wrongDescription}
      </div>
    </div>
  );
};

export default MyInput;

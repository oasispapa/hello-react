import React from "react";
import PropTypes from "prop-types";

const MyComponent = ({ name, sty, children, favoriteNumber }) => {
  //   const { name, style, children } = props;
  return (
    <>
      <p className={sty}>Hi I'm {name}</p>
      <p> child 값은 {children}</p>
      <p> 내가 제일 좋아하는 숫자는 {favoriteNumber}</p>
    </>
  );
};

MyComponent.defaultProps = {
  name: "불신",
};
MyComponent.propTypes = {
  name: PropTypes.string,
  favoriteNumber: PropTypes.number.isRequired,
};

export default MyComponent;

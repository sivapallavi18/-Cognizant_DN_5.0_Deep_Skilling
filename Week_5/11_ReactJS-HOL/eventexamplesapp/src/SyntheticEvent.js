import React from "react";

function SyntheticEvent() {
  const handleClick = () => {
    alert("I was clicked");
  };

  return (
    <div>
      <button onClick={handleClick}>OnPress</button>
    </div>
  );
}

export default SyntheticEvent;

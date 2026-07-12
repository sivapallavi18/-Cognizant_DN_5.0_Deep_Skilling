import React from "react";

function Welcome() {
  const sayWelcome = (msg) => {
    alert(msg);
  };

  return (
    <div>
      <button onClick={() => sayWelcome("Welcome")}>Say Welcome</button>
    </div>
  );
}

export default Welcome;

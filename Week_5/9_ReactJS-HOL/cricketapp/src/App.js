import React from "react";
import ListOfPlayers from "./ListOfPlayers";
import IndianPlayers from "./IndianPlayers";

function App() {

  const flag = false;

  if (flag) {
    return <ListOfPlayers />;
  } else {
    return <IndianPlayers />;
  }
}

export default App;
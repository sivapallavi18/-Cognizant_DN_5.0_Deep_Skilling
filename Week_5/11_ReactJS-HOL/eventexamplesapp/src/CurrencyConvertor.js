import React, { useState } from "react";

function CurrencyConvertor() {
  const [rupees, setRupees] = useState("");
  const [euro, setEuro] = useState("");

  const handleSubmit = () => {
    setEuro((rupees / 95).toFixed(2));
  };

  return (
    <div>
      <h2>Currency Convertor</h2>
      <label>Enter Amount in INR: </label>
      <input type="number" value={rupees} onChange={(e) => setRupees(e.target.value)} />
      <button onClick={handleSubmit} style={{ marginLeft: "10px" }}>Convert</button>
      {euro && <h3>Euro Value: {euro}</h3>}
    </div>
  );
}

export default CurrencyConvertor;

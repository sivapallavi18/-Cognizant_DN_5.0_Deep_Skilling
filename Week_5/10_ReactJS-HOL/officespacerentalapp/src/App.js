import React from "react";

function App() {
  const office = {
    name: "DBS",
    rent: 50000,
    address: "Chennai"
  };

  return (
    <div style={{ marginLeft: "200px", marginTop: "50px" }}>
      <h1>Office Space , at Affordable Range</h1>

      <img
        src="https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=300"
        alt="Office Space"
        width="200"
        height="200"
      />

      <h1>Name: {office.name}</h1>

      <h3
        style={{
          color: office.rent < 60000 ? "red" : "green"
        }}
      >
        Rent: Rs. {office.rent}
      </h3>

      <h3>Address: {office.address}</h3>
    </div>
  );
}

export default App;
import React, { Component } from "react";

class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      count: 0,
      amount: "",
      currency: ""
    };
  }

  increment = () => {
    this.setState({
      count: this.state.count + 1
    });

    alert("Hello Member");
  };

  decrement = () => {
    this.setState({
      count: this.state.count - 1
    });
  };

  sayWelcome = (msg) => {
    alert(msg);
  };

  syntheticEvent = () => {
    alert("I was clicked");
  };

  handleAmountChange = (e) => {
    this.setState({
      amount: e.target.value
    });
  };

  handleCurrencyChange = (e) => {
    this.setState({
      currency: e.target.value
    });
  };

  handleSubmit = () => {
  let amount = parseInt(this.state.amount);
  let result = amount * 80;

  alert("Converting to Euro Amount is " + result);
};

  render() {
    return (
      <div style={{ marginLeft: "30px", marginTop: "20px" }}>
        
        <h3>{this.state.count}</h3>

        <button onClick={this.increment}>
          Increment
        </button>

        <br /><br />

        <button onClick={this.decrement}>
          Decrement
        </button>

        <br /><br />

        <button
          onClick={() =>
            this.sayWelcome("welcome")
          }
        >
          Say welcome
        </button>

        <br /><br />

        <button onClick={this.syntheticEvent}>
          Click on me
        </button>

        <br /><br /><br />

        <h1 style={{ color: "green" }}>
          Currency Convertor!!!
        </h1>

        <table>
          <tbody>
            <tr>
              <td>Amount:</td>
              <td>
                <input
                  type="text"
                  value={this.state.amount}
                  onChange={this.handleAmountChange}
                />
              </td>
            </tr>

            <tr>
              <td>Currency:</td>
              <td>
                <input
                  type="text"
                  value={this.state.currency}
                  onChange={this.handleCurrencyChange}
                />
              </td>
            </tr>
          </tbody>
        </table>

        <br />

        <button onClick={this.handleSubmit}>
          Submit
        </button>

      </div>
    );
  }
}

export default App;
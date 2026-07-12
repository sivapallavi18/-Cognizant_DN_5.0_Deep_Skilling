import React, { Component } from "react";

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  incrementValue = () => {
    this.setState({ count: this.state.count + 1 });
  };

  sayHello = () => {
    alert("Hello! Counter Increased");
  };

  handleIncrement = () => {
    this.incrementValue();
    this.sayHello();
  };

  decrementValue = () => {
    this.setState({ count: this.state.count - 1 });
  };

  render() {
    return (
      <div>
        <h2>Counter Value: {this.state.count}</h2>
        <button onClick={this.handleIncrement}>Increment</button>
        <button onClick={this.decrementValue} style={{ marginLeft: "10px" }}>Decrement</button>
      </div>
    );
  }
}

export default Counter;

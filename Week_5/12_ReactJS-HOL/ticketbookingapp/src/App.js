import React, { Component } from "react";
import GuestPage from "./GuestPage";
import UserPage from "./UserPage";
import LoginButton from "./LoginButton";
import LogoutButton from "./LogoutButton";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      isLoggedIn: false,
    };
  }

  handleLogin = () => {
    this.setState({ isLoggedIn: true });
  };

  handleLogout = () => {
    this.setState({ isLoggedIn: false });
  };

  render() {
    const isLoggedIn = this.state.isLoggedIn;

    return (
      <div style={{ marginLeft: "150px", marginTop: "100px" }}>
        {isLoggedIn ? <UserPage /> : <GuestPage />}

        {isLoggedIn ? (
          <LogoutButton onClick={this.handleLogout} />
        ) : (
          <LoginButton onClick={this.handleLogin} />
        )}
      </div>
    );
  }
}

export default App;

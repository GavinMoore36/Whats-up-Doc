import React, { Component } from 'react'

class Login extends Component {
  state = {
    logIn: false
    // userType: ''
  }

  handleLoginClick = (event) => {
    event.preventDefault()
    this.setState({
      logIn: !this.state.logIn
    })
  }

  // handleUserClick = (event) => {
  //   console.log(event.target.value)
  //   this.setState({
  //     userType: event.target.value,
  //     logIn: false
  //   })
  // }

  hospitalLocations = () => {
    // console.log(this.props.hospitals)
    return this.props.hospitals.map(hospital => <option key={hospital.id} name={hospital.id}>{hospital.facility_name}</option>)
  }

  handleRender = () => {
    if (this.props.userType === 'patient') {
      if (this.state.logIn) {
        return (
          <div>
            <div className="ui attached message">
              <div className="header">
                Welcome back to What's-Up-Doc!
              </div>
              <p>Please sign in</p>
            </div>
            <form className="ui form attached fluid segment">
              <div onChange={this.props.handleInput} className="field">
                <label>Username</label>
                <input name='username' placeholder="Username" type="text"/>
              </div>
              <div onChange={this.props.handleInput} className="field">
                <label>Password</label>
                <input name='password' type="password"/>
              </div>
              <div onClick={this.props.handleLogin} className="ui blue submit button">Sign-In</div>
            </form>
            <div className="ui bottom attached warning message">
              <i className="icon help"></i>
              Haven't signed up? <a onClick={this.handleLoginClick} href="#">Sign-up here</a>.
            </div>
          </div>
        )
    } else {
    return (
      <div>
        <div className="ui attached message">
          <div className="header">
            Welcome to What's-Up-Doc!
          </div>
          <p>Fill out the form below to sign-up for a new account</p>
        </div>
        <form className="ui form attached fluid segment">
          <div className="two fields">
            <div onChange={this.props.handleInput} className="field">
              <label>First Name</label>
              <input name='first_name' placeholder="First Name" type="text"/>
            </div>
            <div onChange={this.props.handleInput} className="field">
              <label>Last Name</label>
              <input name='last_name' placeholder="Last Name" type="text"/>
            </div>
          </div>
          <div onChange={this.props.handleInput} className="field">
            <label>Bio</label>
            <input name='description' placeholder="Description" type="text"/>
          </div>
          <div onChange={this.props.handleInput} className="field">
            <label>Picture</label>
            <input name='image' placeholder="Image URL" type="text"/>
          </div>
          <div onChange={this.props.handleInput} className="field">
            <label>Username</label>
            <input name='username' placeholder="Username" type="text"/>
          </div>
          <div onChange={this.props.handleInput} className="field">
            <label>Password</label>
            <input name='password' type="password"/>
          </div>
          <div onClick={this.props.fetchSignUp} className="ui blue submit button">Submit</div>
        </form>
        <div className="ui bottom attached warning message">
          <i className="icon help"></i>
          Already signed up? <a onClick={this.handleLoginClick} href="#">Login here</a> instead.
        </div>
      </div>
    )
    }
  } else if (this.props.userType === 'doctor') {
      if (this.state.logIn) {
        return (
          <div>
            <div className="ui attached message">
              <div className="header">
                Welcome back to What's-Up-Doc!
              </div>
              <p>Please sign in</p>
            </div>
            <form className="ui form attached fluid segment">
              <div onChange={this.props.handleInput} className="field">
                <label>Username</label>
                <input name='username' placeholder="Username" type="text"/>
              </div>
              <div onChange={this.props.handleInput} className="field">
                <label>Password</label>
                <input name='password' type="password"/>
              </div>
              <div onClick={this.props.handleLogin} className="ui blue submit button">Sign-In</div>
            </form>
            <div className="ui bottom attached warning message">
              <i className="icon help"></i>
              Haven't signed up? <a onClick={this.handleLoginClick} href="#">Sign-up here</a>.
            </div>
          </div>
        )
    } else {
      return (
        <div>
          <div className="ui attached message">
            <div className="header">
              Welcome to What's-Up-Doc!
            </div>
            <p>Fill out the form below to sign-up for a new account</p>
          </div>
          <form className="ui form attached fluid segment">
            <div className="two fields">
              <div onChange={this.props.handleInput} className="field">
                <label>Name</label>
                <input name='name' placeholder="name" type="text"/>
              </div>
              <div onChange={this.props.handleInput} className="field">
                <label>Specialty</label>
                <input name='specialty' placeholder="Specialty" type="text"/>
              </div>
            </div>
            <div onChange={this.props.handleInput} className="field">
              <label>Description</label>
              <input name='description' placeholder="description" type="text"/>
            </div>
            <div onChange={this.props.handleInput} className="field">
              <label>Picture</label>
              <input name='image' placeholder="Image URL" type="text"/>
            </div>
            <div className="two fields">
              <div onChange={this.props.handleInput} className="field">
                <label>Username</label>
                <input name='username' placeholder="Username" type="text"/>
              </div>
              <div onChange={this.props.handleInput} className="field">
                <label>Password</label>
                <input name='password' type="password"/>
              </div>
            </div>
            <div onChange={this.props.handleInput} className="field">
              <label>Hospital</label>
              <select name='hospital' className="ui fluid dropdown">
                <option value="">Please Pick A Hospital</option>
                {this.hospitalLocations()}
              </select>
            </div>
            <div onClick={this.props.fetchSignUp} className="ui blue submit button">Submit</div>
          </form>
          <div className="ui bottom attached warning message">
            <i className="icon help"></i>
            Already signed up? <a onClick={this.handleLoginClick} href="#">Login here</a> instead.
          </div>
        </div>
      )
  }
}else {
  return (<></>)
}
}

  render() {
    return (
    <div>
      <h1 className="ui huge teal header">What's-Up Doc?</h1>
      <img className="ui fluid image" src="https://blog.advids.co/wp-content/uploads//2017/07/health-11-min.gif" alt='homePage'/>
      <br></br>
      <h2>Lets Sign In</h2>
      <select onChange={this.props.handleUserClick} className="ui fluid dropdown">
        <option value="">What kind of user are you?</option>
        <option value="patient">Patient</option>
        <option value="doctor">Doctor</option>
      </select>
      {this.handleRender()}
    </div>
  )
  }
}

export default Login

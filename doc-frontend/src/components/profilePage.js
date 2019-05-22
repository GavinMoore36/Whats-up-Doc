import React, {Component} from 'react'
import UserList from './userList'

class ProfilePage extends Component {
  state = {
    buttonName: '',
    buttonClick: false
  }

  handleButtonClick = (event) => {
    console.log(event.target.name);
    this.setState({
      buttonClick: !this.state.buttonClick
    })
  }

  handleCards = () => {
      return this.props.currentUser.visits.map(visit =>
       <UserList key={visit.id} visit={visit}
        userType={this.props.userType}
         workingWithVisit={this.props.edittingVisit}
          handleChange={this.props.handleChange}
          handleClick={this.props.handleClick}
          form={this.props.form}/>
       )
   }

  handleButtonRender = () => {
    // console.log(this.props.currentUser)
      if (this.state.buttonClick) {
        return (
            <>
              {this.handleCards()}
            </>
        )
      } else {
        return (<></>)
      }
  }

  profileRender = () => {
    if (this.props.userType === 'patient') {
      return (
        <>
          <div className="ui segment">
            <img className="ui small left circular floated image" alt={this.props.currentUser.first_name} src={this.props.currentUser.image}/>
            <h2>{this.props.currentUser.first_name} {this.props.currentUser.last_name}</h2>
            <p>{this.props.currentUser.description}</p>
          </div>
          <br></br>
          <button onClick={this.handleButtonClick} className="ui inverted primary button" name='patient'>Visits</button>
          <div className="ui cards">
            {this.handleButtonRender()}
          </div>
        </>
      )
    } else if(this.props.userType === 'doctor'){
      return (
        <>
          <div className="ui segment">
            <img className="ui small left circular floated image" alt={this.props.currentUser.name} src={this.props.currentUser.image}/>
            <h2 className='ui header'>{this.props.currentUser.name}</h2>
            <p>{this.props.currentUser.description}</p>
            <br></br>
            <h5 className="ui header"><strong>Specialty:</strong> {this.props.currentUser.specialty}</h5>
            <h5 className="ui header"><strong>Hospital:</strong> {this.props.currentUser.hospital.facility_name}</h5>
          </div>
          <br></br>
          <a onClick={this.handleButtonClick} className="ui inverted primary button" name='doctor'>Visits</a>
          <div className="ui cards">
            {this.handleButtonRender()}
          </div>
        </>
      )
    }
  }

  render() {
    return (
      <>
       {this.profileRender()}
      </>
    )
  }
}

export default ProfilePage

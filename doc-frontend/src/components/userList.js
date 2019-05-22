import React, {Component} from 'react'
import VisitForm from '../components/visitForm'

class UserList extends Component {
  // state = {
  //   form: false
  // }
  // onlyUnique = (value, index, self) => {
  //   return self.indexOf(value) === index
  // }

 // formButton = () => {
 //   this.setState({
 //     form: !this.state.form
 //   })
 // }
 handleForm = (id) => {
   return this.props.form ? <VisitForm daId={id} handleChange={this.props.handleChange} workingWithVisit={this.props.workingWithVisit}/> : <></>
 }
//userType={this.props.userType}

 // handleClick = () => {
 //   this.setState({
 //     form: !this.state.form
 //   })
 // }

  handleDisplay = () => {
    if (this.props.userType === 'doctor') {
      const fullName = `${this.props.visit.patient.first_name} ${this.props.visit.patient.last_name}`
      return (
        <div className="card">
          <div className="content">
            <img className="right floated mini ui image" alt={this.props.visit.patient.id} src={this.props.visit.patient.image}/>
            <div className="header">
              {this.props.visit.ailment}
            </div>
            <div className="meta">
              {fullName}
            </div>
          <div className="description">
            {this.props.visit.description}
          </div>
          <div className="extra content">
            <div onClick={this.props.handleClick} className="ui basic green button">Edit</div>
          </div>
        </div>
          {this.handleForm(this.props.visit.id)}
      </div>
      )
    } else if (this.props.userType === 'patient') {
      return (
        <div className="card">
          <div className="content">
            <img className="right floated mini ui image" alt={this.props.visit.doctor.id} src={this.props.visit.doctor.image}/>
            <div className="header">
              {this.props.visit.ailment}
            </div>
            <div className="meta">
              {this.props.visit.doctor.name}
            </div>
          <div className="description">
            {this.props.visit.description}
          </div>
        </div>
      </div>
      )
    }
  }

  render() {
    return (
      <>{this.handleDisplay()}</>
    )
  }
}

// <div className="extra content">
//   <div className="ui basic green button">Approve</div>
// </div>
export default UserList

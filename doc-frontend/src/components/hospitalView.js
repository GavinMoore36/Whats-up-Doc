import React, {Component} from 'react'
import VisitForm from './visitForm'

class HospitalView extends Component {
  // state = {
  //   form: false
  // }
  // const address = `${props.hospital.street}, ${props.hospital.state}, ${props.hospital.state}, ${props.hospital.zip}`
// handleClick = () => {
//   this.setState({
//     form: !this.state.form
//   })
// }
  // const phoneNumber = `(${props.hospital.phone.slice(0,3)}) ${props.hospital.phone.slice(3,6)}-${props.hospital.phone.slice(6,10)}`
handleForm = (id) => {
  return this.props.form ? <VisitForm daId={id}
   handleClick={this.handleClick}
    handleChange={this.props.handleChange}
     workingWithVisit={this.props.addingVisit}/> : <></>
}
//userType={this.props.userType}

   doctorCards = () => {
    return this.props.hospital.doctors.map(doctor => {
      if (this.props.userType === 'doctor') {
        return (
          <div key={doctor.id} className="ui items">
            <div className="item">
              <div className="image">
                <img src={doctor.image} alt={doctor.name}/>
              </div>
              <div className="content">
                <a className="ui header">{doctor.name}</a>
                <div className="meta">
                  <span>{doctor.specialty}</span>
                </div>
                <div className="description">
                  <p>{doctor.description}</p>
                </div>
              </div>
            </div>
          </div>
        )
      } else {
        return (
        <div key={doctor.id}>
          <div className="ui items">
            <div className="item">
              <div className="image">
                <img src={doctor.image} alt={doctor.name}/>
              </div>
              <div className="content">
                <a className="ui header">{doctor.name}</a>
                <div className="meta">
                  <span>{doctor.specialty}</span>
                </div>
                <div className="description">
                  <p>{doctor.description}</p>
                </div>
                <div className="visit">
                  <a onClick={this.props.handleClick} className='ui button'>Schedule Visit</a>
                </div>
              </div>
            </div>
          </div>
          {this.handleForm(doctor.id)}
        </div>
          )
        }
      })
    }

render() {
  return (
    <div>
      <div>
        <h3 className="ui block header">{this.props.hospital.facility_name}</h3>
          <button className="fluid ui button" onClick={() => this.props.goBack(this.props.hospital.id)}>Go Back</button>
     </div>
    {this.doctorCards()}
   </div>
    )
  }
}

export default HospitalView

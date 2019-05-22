import React, { Component } from 'react'
import Hospital from '../components/hospital'

class HospitalContainer extends Component {

  renderHospitals = () => this.props.hospitals.map((hospital, id) => <Hospital key={id} handleHospitalClick={this.props.handleHospitalClick} hospital={hospital} />)

  render() {
    return (
      <div className="ui four column cards">
        {this.renderHospitals()}
      </div>
    )
  }
}

export default HospitalContainer

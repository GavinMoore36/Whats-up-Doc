import React from 'react'

const Hospital = (props) => {
  // const { hospital, handleHospitalClick } = props;

  const address = `${props.hospital.street}, ${props.hospital.city}, ${props.hospital.state}, ${props.hospital.zip}`

  const phoneNumber = `(${props.hospital.phone.slice(0,3)}) ${props.hospital.phone.slice(3,6)}-${props.hospital.phone.slice(6,10)}`

  return (
    <div className="teal card">
      <div className="center aligned content">
        <div className="header">{props.hospital.facility_name}</div>
        <div className="description">
          <strong>{props.hospital.description}</strong><br></br>
          {address}<br></br>
          {phoneNumber}
        </div>
      </div>
      <div className="ui bottom attached button" onClick={() => props.handleHospitalClick(props.hospital.id)}>
        <i className="add icon"></i>
        View Doctors
      </div>
    </div>
    )
}

export default Hospital

// <div className="title">
// <i className="dropdown icon"></i>
// {hospital.facility_name}
// </div>
// <div className="content">
// <p>Address: {address}</p>
// <p>County: {hospital.county}</p>
// <p>Phone: {phoneNumber}</p>
// <p>About Us: {hospital.description}</p>
// </div>
// </>

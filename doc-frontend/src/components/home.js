import React from 'react'
import '../App.css';

const home = (props) => {

  const statBar = () => {
    return (<div className="ui centered statistics">
              <div className="statistic">
                <div className="value">
                  834
                </div>
                <div className="label">
                  Hospitals/Clinics
                </div>
              </div>
              <div className="statistic">
                <div className="value">
                  1668
                </div>
                <div className="label">
                  Doctors
                </div>
              </div>
              <div className="statistic">
                <div className="value">
                  2176
                </div>
                <div className="label">
                  Members
                </div>
              </div>
              <div className="statistic">
                <div className="value">
                  3151
                </div>
                <div className="label">
                  Visits
                </div>
              </div>
            </div>)
  }


  return (
    <div>
      <h1 className="ui huge teal header">What's-Up Doc?</h1>
      <img className="ui fluid image" href="#" src="https://cdn.dribbble.com/users/976984/screenshots/3727819/hospital.gif" alt='homePage'/>
      <br></br>
      <div className='ui center aligned grid'>
        {statBar()}
      </div>
      <br></br>
      <div className="ui teal compact center aligned segment">
        <strong>
          Welcome
        </strong>
        <p>This is a basic app that was designed with the people of New York in Mind.
        Our goal is to help those that have trouble finding a medical facility near them and doctors that are on staff at various locations.
        We have over 1000 hospitals and clinics and double the staff on our app. We strive to improve the app and plan to extend this accross the country.
        We hope to hear for your feedback for any questions or concerns.
        </p>
      </div>
    </div>
  )
}

export default home

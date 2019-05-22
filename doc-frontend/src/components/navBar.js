import React from 'react'

const navBar = (props) => {

  return (
    <div background-color= 'FloralWhite'>
      <div className="ui top flex menu">
        <div className="teal item">
          <img onClick={props.handleNavBar} name="Home" src='https://media.giphy.com/media/9LWavPUfVpQaa9RCHB/giphy.gif' alt='logo' height='40' weight='40'/>
        </div>
        <a onClick={props.handleNavBar} name='Hospitals' className="teal item">Hospitals</a>
        <a onClick={props.handleNavBar} name='Profile' className="teal item">Profile</a>
        <a onClick={props.handleNavBar && props.handleSignOut} name='SignOut' className="teal item">Sign-out</a>
    </div>
  </div>
  )

}

export default navBar

import React, { Component } from 'react';
import './App.css';
import HospitalContainer from './containers/hospitalContainer'
import HospitalView from './components/hospitalView'
import NavBar from './components/navBar'
import Search from './components/Search'
import Login from './components/login'
import Home from './components/home'
import Profile from './components/profilePage'

class App extends Component {
  state = {
    hospitals: [],
    patients: [],
    doctors: [],
    visits: [],
    clicked: false,
    form: false,
    selectedHospital: null,
    searchTerm: '',
    cityFilter: [],
    currentUser: '',
    userType: '',
    navBar: '',
    name: '',
    first_name: '',
    last_name: '',
    specialty: '',
    description: '',
    image: '',
    username: '',
    password: '',
    ailment: '',
    hospital: null
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/hospitals')
    .then(res => res.json())
    .then(data =>
      this.setState({
        hospitals: data,
        cityFilter: data
      })
    )
    fetch('http://localhost:3000/api/v1/patients')
    .then(res => res.json())
    .then(data =>
      this.setState({
        patients: data
      })
    )
    fetch('http://localhost:3000/api/v1/doctors')
    .then(res => res.json())
    .then(data =>
      this.setState({
        doctors: data
      })
    )
    fetch('http://localhost:3000/api/v1/visits')
    .then(res => res.json())
    .then(data =>
      this.setState({
        visits: data
      })
    )
}

handleFormClick = () => {
  this.setState({
    form: !this.state.form
  })
}

addingVisit = (id) => {
  // const foundDoctor = this.state.doctors.find(doctor => doctor.id === id)
  fetch('http://localhost:3000/api/v1/visits', {
     method: "POST",
     headers:{
       "Content-Type": "application/json",
       "Accept": "application/json"
     },
     body:JSON.stringify({
       'ailment': this.state.ailment,
       'description': this.state.description,
       'doctor_id': id,
       'patient_id': this.state.currentUser.id
     })
   })
   .then(res => res.json())
   .then(data => {
     console.log(data)
     if(data.error){
       alert(data.error)
     } else {
       this.setState(prevState => {
         return {
         currentUser: {...prevState.currentUser, visits: [...prevState.currentUser.visits, data]},
         ailment: '',
         description: '',
         form: !this.state.form
       }
       })
     }
    })
    // this.setState({
    //   ailment: '',
    //   description: '',
    //   form: !this.state.form
    // })
}

edittingVisit = (visitId) => {
  // const foundDoctor = this.state.doctors.find(doctor => doctor.id === id)
  const idx = this.state.currentUser.visits.findIndex(visit => visit.id === visitId)
  fetch(`http://localhost:3000/api/v1/visits/${visitId}`, {
     method: "PATCH",
     headers:{
       "Content-Type": "application/json",
       "Accept": "application/json"
     },
     body:JSON.stringify({
       'ailment': this.state.ailment,
       'description': this.state.description
     })
   })
   .then(res => res.json())
   .then(data => {
     console.log(data)
     if(data.error){
       alert(data.error)
     } else {
       this.setState(prevState => {
         return {
          currentUser: {...prevState.currentUser, visits: [...prevState.currentUser.visits.slice(0, idx), data, ...prevState.currentUser.visits.slice(idx, prevState.currentUser.visits.length-1)]},
         ailment: '',
         description: '',
         form: !this.state.form
       }
       })
     }
    })
    // this.setState({
    //   ailment: '',
    //   description: '',
    //   form: !this.state.form
    // })
}

handleHospitalClick = (id) => {
  const foundHospital = this.state.hospitals.find(hospital => hospital.id === id)
    this.setState({
      selectedHospital: foundHospital,
      clicked: !this.state.clicked
    })
  }

  handleChange = (event) => {
    // console.log(event.target.value)
    this.setState({
      searchTerm: event.target.value
    })
  }
    handleFormChange = (event) => {
      // console.log(event.target.value)
      this.setState({
        [event.target.name]: event.target.value
      })
  }
  handleNavBar = (event) => {
    if (event.target.name === 'Home' || 'Hospitals' || 'Profile' || 'SignOut') {
      // console.log(event.target.name)
      this.setState({
        navBar: event.target.name
      })
    }
  }

  filterdHospitals = () => {
    return this.state.cityFilter.filter(hospital =>
    hospital.facility_name.toLowerCase().includes(this.state.searchTerm.toLowerCase()) ||
    hospital.description.toLowerCase().includes(this.state.searchTerm.toLowerCase()))
  }

hospitalsDisplay = () => {
  if (this.state.clicked) {
    return <HospitalView handleChange={this.handleFormChange}
     addingVisit={this.addingVisit}
      userType={this.state.userType}
       currentUser={this.state.currentUser}
        hospital={this.state.selectedHospital}
         goBack={this.handleHospitalClick}
         handleClick={this.handleFormClick}
         form={this.state.form}/>
  } else {
    return (
      <div>
        <Search
        handleCityClick={this.handleCityClick}
        searchTerm={this.state.searchTerm}
        handleChange={this.handleChange}
        hospitals={this.state.hospitals}/>
        <HospitalContainer hospitals={this.filterdHospitals()} handleHospitalClick={this.handleHospitalClick} />
      </div>
    )
  }
}
handleCityClick = (event) => {
if (event.target.innerText === 'None') {
  this.setState({
    cityFilter: [...this.state.hospitals]
  })
} else {
  // console.log(event.target.innerText)
  const filteredCity = this.state.hospitals.filter(hospital => hospital.city.includes(event.target.innerText))
  this.setState({
    cityFilter: filteredCity
  })
}
}

handleUserClick = (event) => {
  // console.log(event.target.value)
  this.setState({
    userType: event.target.value
  }, () => console.log(this.state.userType))
}

handleInput = (event) => {
  console.log(event.target.name, event.target.value)
  this.setState({
    [event.target.name]: event.target.value
  })
}

handleLogin = () => {
  // console.log('username:', this.state.username, 'password:', this.state.password)
  if (this.state.userType === 'patient') {
    fetch('http://localhost:3000/api/v1/patients/login', {
       method: "POST",
       headers:{
         "Content-Type": "application/json",
         "Accept": "application/json"
       },
       body:JSON.stringify({
         'username': this.state.username,
         'password': this.state.password
       })
     })
     .then(res => res.json())
     .then(data => {
       // console.log(data)
       if(data.error){
         alert(data.error)
       } else {
         this.setState({
           currentUser: data,
           name: '',
           first_name: '',
           last_name: '',
           specialty: '',
           description: '',
           image: '',
           username: '',
           password: '',
           hospital: null
         })
       }
      })
  } else
  fetch('http://localhost:3000/api/v1/login', {
     method: "POST",
     headers:{
       "Content-Type": "application/json",
       "Accept": "application/json"
     },
     body:JSON.stringify({
       username: this.state.username,
       password: this.state.password
     })
   })
   .then(res => res.json())
   .then(data => {
     // console.log(data)
     if(data.error){
       alert(data.error)
     } else {
       this.setState({
         currentUser: data,
         name: '',
         first_name: '',
         last_name: '',
         specialty: '',
         description: '',
         image: '',
         username: '',
         password: '',
         hospital: null
       })
     }
    })
  }

fetchSignUp = (event) => {
    event.preventDefault()
    if(this.state.userType === "patient"){
    fetch('http://localhost:3000/api/v1/patients', {
      method: "POST",
      headers:{
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body:JSON.stringify({
        'first_name': this.state.first_name,
        'last_name': this.state.last_name,
        'description': this.state.description,
        'image': this.state.image,
        'username': this.state.username,
        'password': this.state.password
      })
    })
    .then(res => res.json())
    .then(data => {
      if(data.error){
        alert(data.error)
      } else {
      this.setState({
        currentUser: data,
        name: '',
        first_name: '',
        last_name: '',
        specialty: '',
        description: '',
        image: '',
        username: '',
        password: '',
        hospital: null
      })
    }
    })
  } else if (this.state.userType === "doctor"){
    fetch('http://localhost:3000/api/v1/doctors', {
      method: "POST",
      headers:{
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body:JSON.stringify({
        'name': this.state.name,
        'specialty': this.state.speciality,
        'description': this.state.description,
        'image': this.state.image,
        'username': this.state.username,
        'password': this.state.password,
        hospital_id: this.state.hospital
      })
    })
    .then(res => res.json())
    .then(data => {
      if(data.error){
        alert(data.error)
      } else {
      this.setState({
        currentUser: data,
        name: '',
        first_name: '',
        last_name: '',
        specialty: '',
        description: '',
        image: '',
        username: '',
        password: '',
        hospital: null
      })
    }
    })
  }
}

handleSignOut = () => {
  this.setState({
    currentUser: '',
    userType: ''
  })
}

handleDisplay = () => {
  switch (this.state.navBar) {
    case 'Hospitals':
        return(
          <>
            <NavBar handleSignOut={this.handleSignOut} handleNavBar={this.handleNavBar}/>
            <h1 className="ui huge header">What's-Up Doc?</h1>
            <header className="App-header">
              <img src='https://media.giphy.com/media/9LWavPUfVpQaa9RCHB/giphy.gif' height='175px' weight='175px' alt="logo" />
              {this.hospitalsDisplay()}
            </header>
          </>
        )
    case 'Home':
        return(
          <>
            <NavBar handleSignOut={this.handleSignOut} handleNavBar={this.handleNavBar}/>
            <Home hospitalsLength={this.state.hospitals.length} patientsLength={this.state.patients.length} doctorsLength={this.state.doctors.length}/>
          </>
        )
    case 'Profile':
        return(
          <>
            <NavBar handleSignOut={this.handleSignOut} handleNavBar={this.handleNavBar}/>
            <Profile currentUser={this.state.currentUser}
             userType={this.state.userType}
             hospitals={this.state.hospitals}
             edittingVisit={this.edittingVisit}
             handleChange={this.handleFormChange}
             handleClick={this.handleFormClick}
             form={this.state.form}/>
          </>
        )
    case 'SignOut':
        return(
          <Login userType={this.state.userType}
          handleUserClick={this.handleUserClick}
          handleLogin={this.handleLogin}
          fetchSignUp={this.fetchSignUp}
          handleInput={this.handleInput}
          hospitals={this.state.hospitals}/>
        )
    default:
    return (
      <>
        <NavBar handleSignOut={this.handleSignOut} handleNavBar={this.handleNavBar}/>
        <Home hospitalsLength={this.state.hospitals.length} patientsLength={this.state.patients.length} doctorsLength={this.state.doctors.length}/>
      </>
    )

  }
}



 handleLoginRender = () => {
   if (this.state.currentUser) {
    return(  <>
              {this.handleDisplay()}
            </>)
   } else {
     return <Login userType={this.state.userType}
          handleUserClick={this.handleUserClick}
          handleLogin={this.handleLogin}
          fetchSignUp={this.fetchSignUp}
          handleInput={this.handleInput}
          hospitals={this.state.hospitals}/>
   }
 }



  render() {
    return (
      <div>
        {this.handleLoginRender()}
      </div>
    )
  }
}
export default App;

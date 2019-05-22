import React from 'react'

function onlyUnique(value, index, self) {
  return self.indexOf(value) === index
}

const searchin = (props) => {

  const renderUniqueCities = props.hospitals.map((hospital) =>
          hospital.city).filter(onlyUnique).sort().map(city =>
              <a key={city} onClick={props.handleCityClick} className='item'>{city}</a>)
  // const uniqueCities = cities.filter(onlyUnique).sort()
  // const renderUniqueCities = cities.map(city => <a className='item'>{city}</a>)

  const dropdown = () =>
  <div multiple='' className="ui compact menu">
    <div className="ui simple dropdown item">
      Cities
      <i className="dropdown icon"></i>
      <div className="menu">
        <a className='item' onClick={props.handleCityClick}>None</a>
        {renderUniqueCities}
      </div>
    </div>
  </div>

  return (
    <div className="ui left aligned menu">
      <div className="ui search item">
        <div className="ui icon input">
          <input className="prompt" onChange={props.handleChange} value={props.searchTerm} type="text" placeholder="Search Hospitals..."/>
          <i className="search icon"></i>
        </div>
      </div>
      {dropdown()}
    </div>
  )
}

export default searchin

import React from 'react'

const visitForm = (props) => {

  return (
    <>
      <div className="ui clearing divider"></div>
      <div className="ui attached message">
        <div className="header">
          Appointment Scheduler!
        </div>
        <p>Fill out the form below</p>
      </div>
      <form className="ui form attached fluid segment">
        <div className="field">
          <label>Ailment</label>
          <input onChange={props.handleChange} placeholder="Ailment here..." name="ailment" type="text"/>
        </div>
        <div className="field">
          <label>Description</label>
          <input onChange={props.handleChange} placeholder="Description..." name="description" type="text"/>
        </div>
        <div onClick={() => props.workingWithVisit(props.daId)} className="ui teal submit button">Submit</div>
      </form>
    </>
  )
}

export default visitForm

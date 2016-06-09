DOM = React.DOM

window.PlacesFormInput = React.createClass
  displayName: "PlacesFormInput"
  
  getInitialState: ->
    {
    }
  logProps: () ->
    console.log(@props)

  render: ->
    @logProps
    DOM.div
      className: 'row control-group'
      DOM.div
        className: 'form-group col-xs-12 floating-label-form-group controls'
        DOM.label
          htmlFor: @props.id
          @props.label
        DOM.input
          id: @props.id
          className: 'form-control'
          placeholder: @props.placeholder
          type: @props.type
        DOM.p
          className: 'help-block text-danger'
            
placesFormInput = React.createFactory(PlacesFormInput)
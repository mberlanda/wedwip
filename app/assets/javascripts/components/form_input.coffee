DOM = React.DOM

FormInput = React.createClass
  displayName: "FormInput"
  render: ->
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
          onChange: @props.onChange
        DOM.p
          className: 'help-block text-danger'

window.formInput = React.createFactory(FormInput)
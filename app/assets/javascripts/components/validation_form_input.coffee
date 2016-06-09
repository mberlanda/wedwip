window.ValidationFormInput = React.createClass
  displayName: "ValidationFormInput"
  
  getInitialState: ->
    {
    }

  render: ->
    formInput
      id: 'prova'
      label: 'prova'
      placeholder: I18n.t('participation.validation_form.validation.placeholder')
      type: 'text'
            
validationFormInput = React.createFactory(ValidationFormInput)
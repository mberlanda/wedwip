DOM = React.DOM
validationKey = 'e0d67e387659dc93136877f61d49bc33ad5568d03b2a4b887d2e81403c26bc0ea11677b2296d09629a1b3527a90dca4e4b235f882e3327e9c9e1db9815549cbc'

window.ValidationFormInput = React.createClass
  displayName: "ValidationFormInput"
  
  getInitialState: ->
    { 
      validation:{
        success: false
        text: null
      }
    }

  validationCodeChanged: (event) ->
    @state.validation.text = event.target.value
    @forceUpdate()

  validateInsertedCode: () ->
    if encrypt(@state.validation.text) == validationKey
      @state.validation.success = true
      @forceUpdate()
    else
      $('#error-validation').html 'Il codice di verifica inserito non è corretto'

  render: ->
    DOM.section
      id: 'participations'
      className: 'bg-gray'
      DOM.div
        className: 'container wow fadeIn'
        DOM.div
          className: 'row'
          DOM.div
            className: 'col-lg-12 text-center'
            DOM.h2({}, I18n.t('participation.header.title'))             
            DOM.hr
              className: 'colored'
            DOM.p({}, I18n.t('participation.header.description'))

        unless @state.validation.success
          DOM.div
            id: 'validation-form'
            className: 'row content-row'
            DOM.div
              className: 'col-lg-8 col-lg-offset-2'
              DOM.span
                I18n.t('participation.validation_form.title')
              formInput
                id: 'validation-form'
                label: I18n.t('participation.validation_form.validation.label')
                placeholder: I18n.t('participation.validation_form.validation.placeholder')
                type: 'text'
                onChange: @validationCodeChanged
              DOM.div
                className: 'form-action'
                DOM.div
                  className: 'row'
                  DOM.br({}, null)
                    DOM.div
                      className: 'col-md-offset-3 col-md-12'
                      DOM.button
                        id: "check-code"
                        className: 'btn default'
                        onClick: @validateInsertedCode
                        I18n.t('participation.validation_form.check')
              DOM.p
                id: 'error-validation'
                style: { color: 'red' }

        else

validationFormInput = React.createFactory(ValidationFormInput)
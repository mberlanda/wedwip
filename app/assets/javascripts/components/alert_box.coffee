DOM = React.DOM

AlertBox = React.createClass
  displayName: "AlertBox"
  getDefaultProps: ->
    alert_type: 'alert-danger'
    message: ''

  render: ->
    DOM.div
      className: 'alert ' + @props.alert_type + ' alert-dismissable'
      DOM.a
        className: 'close'
        title: 'close'
        href: '#'
        'aria-label': 'close'
        'data-dismiss': 'alert'
        'x'
      DOM.strong({}, "Attenzione! ")
      @props.message

window.alertBox = React.createFactory(AlertBox)
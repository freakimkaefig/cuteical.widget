# Get calendar events on your desktop with cute bullets 
# Made by Cara Takemoto
# Using icalBuddy: http://hasseg.org/icalBuddy/
# Requires Python 2.7 


options =
  # To enable the widget, set value to true. To disable, false.
  widgetEnable: true


#This command shows all of your events for today and tomorrow

command: "python ical.widget/calendar_events_txtbullets.py"


# the refresh frequency s is seconds and m is minutes
refreshFrequency: '60s'

options : options

render: (output) -> "
<div class='wrapper'>#{output}</div>
"

update: (output, domEl) ->

  wrapper_display = $(domEl)

  if @options.widgetEnable
      
    wrapper_display.find('.wrapper').html(output)
  else
    wrapper_display.hide()



style: """
  font-family: -apple-system
  left: 30px
  bottom: 120px
  color: #fff

  
  div
    font-size: 11px
    font-weight: 500
    display: block
    color: rgba(255,255,255,1)
    width: 220px

  .wrapper
    width:100%
    display:inline-block

  .title
    font-weight: 700
    font-size: 25px
    padding:6px

  .event_title
    font-weight: 500
    padding-top: 5px
    padding-left: 10px
    margin-left: 1.1em
    text-indent: -1.1em

  .event_time
    font-weight: 200
    padding-left: 24px

  .today
    padding-bottom:10px

  .icon
    font-size: 11px
    color: rgba(#0bf, 1)

"""
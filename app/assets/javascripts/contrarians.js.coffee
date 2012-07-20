# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

show_death_date = (showfield) ->
  if showfield
    $('.deathfield').show()
  else
    $('.deathfield').hide()

$ ->
  $('#contrarian_is_dead').click -> show_death_date $('#contrarian_is_dead').is(':checked')

$ ->
  show_death_date $('#contrarian_is_dead').is(':checked')

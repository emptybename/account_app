# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
    $("#to_account_id").hide()
    $("#new_account").hide()
    $("#tag_type").hide()
    $("#from_account_id").hide()

  

$(document).ready(ready)
$(document).on('page:load', ready)
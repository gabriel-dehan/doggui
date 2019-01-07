# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(".downvote-upvote[data-remote]").on "ajax:success", (response, status) ->
    $(response.currentTarget).find('span').html(response.detail[0].votes)
    response.currentTarget.href = response.detail[0].url

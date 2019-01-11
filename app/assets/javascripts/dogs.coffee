# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(".downvote-upvote[data-remote]").on "ajax:success", (response, status) ->
    if response.detail[0].votes > 0
      $(response.currentTarget).find('span').html(response.detail[0].votes)
    else
      $(response.currentTarget).find('span').html('')
    response.currentTarget.href = response.detail[0].url

  $(".multiple-file-limit-3").change ->
    if this.files.length > 4
      alert('Vous ne pouvez pas ajouter plus de 4 photos')
      this.value = null
      return false

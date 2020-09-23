# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(window).on 'turbolinks:load', ->
    notice = $('#notice')
    timeoutId = null
    $('.public-page-url-btn').click (e) ->
      if navigator.clipboard
        navigator.clipboard.writeText(e.target.dataset['link']).then(->
          notice.text 'Successufully copied link to clipboard'
        ).catch(->
          notice.text 'Couldn\'t copy link to clipboard'
        ).finally ->
          clearTimeout timeoutId
          timeoutId = setTimeout((->
            notice.text ''
          ), 3000)
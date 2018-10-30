$( document ).ready(function() {

  $('#my-destinations').on('click', (e) =>{
    e.preventDefault()
    let id = $('#my-destinations').attr("data-id")
    $.get(`/users/${id}.json`, (user) =>{
      $('#user-show-header').text("My destinations.")
      $('#user-show-button').attr("href", `/destinations/new`)
      $('#user-show-button').text("Create new destination.")

    })
    })



})

$( document ).ready(function() {

  $('#my-trips').on('click', (e) =>{
    e.preventDefault()
    $.get(`/users/`)
    })



})

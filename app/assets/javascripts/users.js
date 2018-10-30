$( document ).ready(function() {

  $('#my-destinations').on('click', (e) =>{
    e.preventDefault()
    let id = $('#my-destinations').attr("data-id")
    $.get(`/users/${id}.json`, (user) =>{
      $('#user-show-header').text("My destinations.")
      // buttons
      let myTrips = `<a class= "button" href="#" id="my-trips" data-id="${id}">my trips.</a>`
      let createDestination = `<a class= "button create_button" href="/destinations/new">Create a new destination.</a>`
      $('#user-buttons').html(myTrips + createDestination)

      // content
      let source   = $("#destinations-template").innerHTML;
      let template = Handlebars.compile(source)
      $('#user-content').html(template)

    })
    })

    $('#my-trips').on('click', (e) =>{
      e.preventDefault()
      let id = $('#my-trips').attr("data-id")
      $.get(`/users/${id}.json`, (user) =>{
        $('#user-show-header').text("My trips.")
        let myDestinations = `<a class= "button" href="#" id="my-destinations" data-id="${id}">my destinations.</a>`
        let createTrip = `<a class= "button create_button" href="/users/${id}/trips/new">Create a new trip.</a>`
        $('#user-buttons').html(myDestinations + createTrip)
        // $('#user-content').html(create handlebar template)

      })
      })



})

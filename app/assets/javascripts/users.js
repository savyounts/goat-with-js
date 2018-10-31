$( document ).ready(function() {

// handlebar helpers
  Handlebars.registerHelper('random_class', () => {
    return `random-background-${Math.floor((Math.random()*7)+1)}`
  })

  Handlebars.registerHelper('random_image', () => {
    return `/images/${Math.floor((Math.random()*7)+1)}.jpg`
  })

// click my destinations
  $('#user-buttons').on('click', '.my-destinations',  (e) =>{
    e.preventDefault()
    let id = $('.my-destinations').attr("data-id")
    $.get(`/users/${id}.json`, (user) =>{
      $('#user-show-header').text("My destinations.")
      // buttons
      let myTrips = `<a class="button my-trips" data-id="${id}" href="#">my trips.</a>`
      let createDestination = `<a class= "button create_button" href="/destinations/new">Create a new destination.</a>`
      $('#user-buttons').html(myTrips + createDestination)

      // content
      let destinationHtml = HandlebarsTemplates['my-destinations-template']({destination: user['custom_destinations']})

      $('#user-content').html(destinationHtml)
    })
  })

// click my trips
    $('#user-buttons').on('click', '.my-trips', (e) =>{
      e.preventDefault()
      let id = $('.my-trips').attr("data-id")
      $.get(`/users/${id}.json`, (user) =>{
        $('#user-show-header').text("My trips.")
        // buttons
        let myDestinations = `<a class= "button my-destinations" href="#" data-id="${id}">my destinations.</a>`
        let createTrip = `<a class= "button create_button" href="/users/${id}/trips/new">Create a new trip.</a>`
        $('#user-buttons').html(myDestinations + createTrip)
        // content
        let tripsHtml = HandlebarsTemplates['my-trips-template']({trip: user['trips']})

        $('#user-content').html(tripsHtml)
      })
    })



})

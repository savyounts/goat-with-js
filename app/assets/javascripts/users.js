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
    updatePage('destination', 'trips', 'custom_destination')
  })

// click my trips
    $('#user-buttons').on('click', '.my-trips', (e) =>{
      e.preventDefault()
      updatePage('trip', 'destinations')
    })

const updatePage = (object, other, custom) => {
  let id = $(`.my-${object}s`).attr("data-id")
  $.get(`/users/${id}.json`, (user) =>{
    $('#user-show-header').text(`My ${object}s.`)

    // buttons
    let createTrip = createButton(id, object)
    $('#user-buttons').html(displayOtherButton(id, other) + createTrip)

    // content
    let contentHtml = HandlebarsTemplates[`my-${object}s-template`]({object: user[`${custom || object}s`]})
    $('#user-content').html(contentHtml)
  })
}


const createButton = (id, object) => {
  return `<a class= "button create_button" href="/users/${id}/${object}s/new">Create a new ${object}.</a>`
}

const displayOtherButton = (id, other) =>{
  return `<a class= "button my-${other}" href="#" data-id="${id}">my ${other}.</a>`
}

})

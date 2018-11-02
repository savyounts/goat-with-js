$( document ).ready(function() {

  // initial page set up
  const hideElements = () => {
    let next = $('#next-button')
    let previous = $('#previous-button')
    if (previous.attr("data-destId") === "1") {previous.hide()}
    if (next.attr("data-last-dest") === next.attr("data-destId")) {next.hide()}
    $('#comment-form').hide()
  }
  hideElements()

  const conditionalButtons = (creatorId = null) => {
    let creator = creatorId || parseInt($('#user').attr("data-creator_id"))
    let user = parseInt($('#user').attr("data-user_id"))
    let $conditionals = $('#conditional-buttons')
    user !== creator ? $conditionals.hide() : $conditionals.show()
  }
  conditionalButtons()

 // content updaters
  const updateButtonLinks = (destinationId) => {
    $('#next-button').show().attr("data-destId", destinationId)
    $('#previous-button').show().attr("data-destId", destinationId)
    $('#add').attr("href", `/destinations/${destinationId}/plans/new`)
    $('#delete').attr("href", `/destinations/${destinationId}`)
    $('#update').attr("href", `/destinations/${destinationId}/edit`)
    $('.submit-comment').attr("data-destination_id", destinationId)
  }

  const updateDestinationContent = (destination) =>{
    $('#dest-name').text(destination.name)
    $('#location').text(`Location: ${destination.city}, ${destination.country}`)
    $('#description').text(destination.description)

    let md = destination.must_dos ? destination.must_dos : ""
    $('#must_dos').text(md)

    let dd = destination.dont_dos ? destination.dont_dos : ""
    $('#dont_dos').text(dd)

    let dt = destination.day_trips ? destination.day_trips : ""
    $('#day_trips').text(dt)
}

const sortComments = (destination) => {
  return destination.comments.sort((b,a) => (a.likes > b.likes) ? 1 : ((b.likes > a.likes) ? -1 : 0));
}

const updateComments = (destination) => {
  $('.comment-div').html("")
  let sorted = sortComments(destination)
  sorted.forEach(comment => {
    let new_comment = HandlebarsTemplates['comments-template']({comment: comment})
    $('.comment-div').append(new_comment)
  })
}

  const updatePage = (destinationId) =>{
    let current_user_id = parseInt($('#user').attr("data-user_id"))
    $.get(`/destinations/${destinationId}.json`, (destination) =>{
      updateDestinationContent(destination)
      updateButtonLinks(destinationId)
      hideElements()
      $('.show-form').show()
      conditionalButtons(destination.creator_id)
      updateComments(destination)
    })
  }

  // event handlers
  $('.wrapper').on('click', '#next-button', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    updatePage(nextId)
  })

  $('.wrapper').on('click', '#previous-button', (e) => {
    e.preventDefault()
    let previousId = parseInt($("#previous-button").attr("data-destId")) - 1
    updatePage(previousId)
  })

  // show comment form
  $('.show-form').on('click', (e) =>{
    e.preventDefault()
    $('.show-form').hide()
    $('#comment-form').slideDown('slow')
  })


})

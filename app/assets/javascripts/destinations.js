$( document ).ready(function() {

  $('#comment-form').hide()

  const hideButtons = () => {
    let next = $('#next-button')
    let previous = $('#previous-button')
    if (previous.attr("data-destId") === "1") {previous.hide()}
    if (next.attr("data-last-dest") === next.attr("data-destId")) {next.hide()}
  }
  hideButtons()

  $('.comments').on('click', '#next-button', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    updatePage(nextId)
  })

  $('.comments').on('click', '#previous-button', (e) => {
    e.preventDefault()
    let previousId = parseInt($("#previous-button").attr("data-destId")) - 1
    updatePage(previousId)
  })

  const updatePage = (destinationId) =>{
    let current_user_id = parseInt($('#user').attr("data-user_id"))
    $.get(`/destinations/${destinationId}.json`, (destination) =>{
      // destination content
      $('#dest-name').text(destination['name'])
      $('#location').text(`Location: ${destination['city']}, ${destination['country']}`)
      $('#description').text(destination['description'])

      let md = destination['must_dos'] ? destination['must_dos'] : ""
      $('#must_dos').text(md)

      let dd = destination['dont_dos'] ? destination['dont_dos'] : ""
      $('#dont_dos').text(dd)

      let dt = destination['day_trips'] ? destination['day_trips'] : ""
      $('#day_trips').text(dt)

      // button links
      $('#next-button').show().attr("data-destId", destinationId)
      $('#previous-button').show().attr("data-destId", destinationId)
      hideButtons()
      $('#add').attr("href", `/destinations/${destinationId}/plans/new`)
      $('#delete').attr("href", `/destinations/${destinationId}`)
      $('#update').attr("href", `/destinations/${destinationId}/edit`)
      $('.submit-comment').attr("data-destination_id", destinationId)

      // conditional buttons
      if(current_user_id !== destination.creator_id){
        $('#conditional-buttons').hide()
      }else{
        $('#conditional-buttons').show()
      }


      // Comments
      $('.comment-div').html("")
      destination['comments'].forEach(comment =>{
        // let comment.username =
        let new_comment = HandlebarsTemplates['comments-template']({comment: comment})
        $('.comment-div').append(new_comment)
      })
    })
  }

  // show comment form
  $('.show-form').on('click', (e) =>{
    e.preventDefault()
    $('.show-form').hide()
    $('#comment-form').slideDown('slow')
  })


})

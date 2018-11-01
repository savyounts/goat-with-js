$( document ).ready(function() {

  $('#comment-form').hide()
  // $('#comment-submit').hide()

  $('.wrapper').on('click', '#next-button', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    let current_user_id = parseInt($('#user').attr("data-user_id"))

    $.get(`/destinations/${nextId}.json`, (destination) =>{
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
      $('#next-button').attr("data-destId", destination["id"])
      $('#add').attr("href", `/destinations/${nextId}/plans/new`)
      $('#delete').attr("href", `/destinations/${nextId}`)
      $('#update').attr("href", `/destinations/${nextId}/edit`)

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
  })


  // show comment form
  $('.show-form').on('click', (e) =>{
    e.preventDefault()
    $('.show-form').hide()
    $('#comment-form').slideDown('slow')
  })


})

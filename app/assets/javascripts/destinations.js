$( document ).ready(function() {

  $('#comment-form').hide()

  $('#next-button').on('click', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    let current_user
    $.get(`/destinations/${nextId}.json`, (destination) =>{
      // destination content
      $('#dest-name').text(destination['name'])
      $('#location').text(`Location: ${destination['city']}, ${destination['country']}`)
      $('#description').text(destination['description'])
      if (destination['must_dos']){$('#must_dos').text(destination['must_dos'])}
      if (destination['dont_dos']){$('#dont_dos').text(destination['dont_dos'])}
      if (destination['day_trips']){$('#day_trips').text(destination['day_trips'])}
      // button links
      $('#next-button').attr("data-destId", destination["id"])
      $('#add').attr("href", `/destinations/${nextId}/plans/new`)
      $('#delete').attr("href", `/destinations/${nextId}`)
      $('#update').attr("href", `/destinations/${nextId}/edit`)

      // conditional buttons
      if(current_user !== destination.creator_id){
        $('#conditional-buttons').hide()
      }


      // Comments
      $('.comment-div').html("")
      destination['comments'].forEach(comment =>{
      //   // $('.comment-username').text(findUser(comment['user_id']))
        let new_comment = HandlebarsTemplates['comments-template']({comment: comment})
        $('.comment-div').append(new_comment)
        if(current_user !== comment['user_id']){
          $('#edit-comment').hide()
        }
      })

      // comment form
      $('#comment-form-userId').attr("value", `${current_user}`)
      $('#comment-form-destinationId').attr("value", `${destination['id']}`)
      $('#comment-form-content').attr('placeholder', "leave message here")
    })
  })

  // show comment form
  $('#leave-message').on('click', (e) =>{
    e.preventDefault()
    $('#comment-form').show()
  })







})

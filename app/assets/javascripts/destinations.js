$( document ).ready(function() {

  $('#comment-form').hide()
  // $('#comment-submit').hide()

  $('#next-button').on('click', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    let current_user
    $.get(`/destinations/${nextId}.json`, (destination) =>{
      // destination content
      $('#dest-name').text(destination['name'])
      $('#location').text(`Location: ${destination['city']}, ${destination['country']}`)
      $('#description').text(destination['description'])
      if (destination['must_dos']){
        $('#must_dos').text(destination['must_dos'])
      }else{
        $('#must_dos').text("")
      }
      if (destination['dont_dos']){
        $('#dont_dos').text(destination['dont_dos'])
      }else{
        $('#dont_dos').text("")
      }
      if (destination['day_trips']){
        $('#day_trips').text(destination['day_trips'])
      }else{
        $('#day_trips').text("")
      }

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
      })

      // comment form
      $('#comment-form-userId').attr("value", `${current_user}`)
      $('#comment-form-destinationId').attr("value", `${destination['id']}`)
      $('#comment-form-content').attr('placeholder', "leave message here")
    })
  })

  // show comment form
  // $('.show-form').on('click', (e) =>{
  //   e.preventDefault()
  //   $('#comment-submit').show()
  // })

  $('.show-form').on('click', (e) =>{
    e.preventDefault()
    $('.show-form').hide()
    $('#comment-form').slideDown('slow')
  })

// submit comment form

// $('#comment-submit').submit((e) => {
//   e.preventDefault()
//   let values = $('#comment-submit').serialize()
//   console.log(values)
//   let posting = $.post('/comments', values);
//
//   posting.done(function(data) {
//     let new_comment = HandlebarsTemplates['comments-template']({comment: data})
//     $('.comment-div').append(new_comment)
//   });
// })

$('.submit-comment').on('click', (e) => {
  e.preventDefault()
  var $button = $('.submit-comment');
  let data = {comment: {
        'action' : '/comments',
        'user_id': $button.data("user_id"),
        'destination_id': $button.data("destination_id"),
        'content' : $( '.comment-textarea' ).val()
    }
  };
  $('.comment-textarea').val('').attr('placeholder', "leave message here")
  var posting = $.post('/comments', data);

  posting.done(function(data) {
    let new_comment = HandlebarsTemplates['comments-template']({comment: data})
    $('.comment-div').append(new_comment)
    $('#comment-form').hide()
    $('.show-form').show()
  });
})






})

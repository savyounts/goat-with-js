$( document ).ready(function() {

  $('#next-button').on('click', (e) => {
    e.preventDefault()
    let nextId = parseInt($("#next-button").attr("data-destId")) + 1
    $.get(`/destinations/${nextId}.json`, (destination) =>{
      // destination content
      $('#dest-name').text(destination['name'])
      $('#location').text(`Location: ${destination['city']}, ${destination['country']}`)
      $('#description').text(destination['description'])
      $('#must_dos').text(destination['must_dos'])
      $('#dont_dos').text(destination['dont_dos'])
      $('#day_trips').text(destination['day_trips'])
      // button links
      $('#update').attr("href", `/destinations/${nextId}/edit`)
      $('#add').attr("href", `/destinations/${nextId}/plans/new`)
      $('#delete').attr("href", `/destinations/${nextId}`)
      $('#next-button').attr("data-destId", destination["id"])

      // Comments
      // let comments = () =>{
        destination['comments'].forEach(comment =>{
      //   // $('.comment-username').text(findUser(comment['user_id']))
        console.log(comment['content'])
        $('.comment-content').text(comment['content'])
        $('.comment-likes').text(comment['likes'])
        $('#edit-comment').attr("href", `/comments/${comment['id']}/edit`)
      //   })
      // }
      // comments().forEach(comment =>{
      //   $('.comment-div').append(comment)
      })
    })
  })





})

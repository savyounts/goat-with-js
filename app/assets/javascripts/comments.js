$( document ).ready(function() {
  // Comment class
  class Comment{
    constructor(data){
      this.id = data.id
      this.content = data.content
      this.likes = 0
    }

    toString(){
      return HandlebarsTemplates['comments-template']({comment: this})
    }
  }

// like/dislike functions
  const updateLikes = (buttonClass, number, id) =>{
      let info = $(buttonClass).data()
      let likes = info.likes + number
      let commentId = id
      let destinationId = info.destination
      let data = {comment:{
          id: commentId,
          likes: (likes >= 0 ? likes : 0)
        }
      }

      let update = $.ajax({
              url: `/comments/${commentId}`,
              type: 'PATCH',
              dataType: "json",
              data: data
            });
      update.done(function(){
        $(`#like-button-${commentId}`).attr('data-likes', likes)
        $(`#dislike-button-${commentId}`).attr('data-likes', likes)
        $(`#comment-${commentId}-likes`).text(likes)
      })
  }

  $('.wrapper').on('click', '.like-button', (e)=>{
    e.preventDefault()

    const commentId = parseInt(e.target.dataset.id)
    updateLikes('.like-button', 1, commentId)
  })

  $('.wrapper').on('click', '.dislike-button', (e)=>{
    e.preventDefault()
    const commentId = parseInt(e.target.dataset.id)
    updateLikes('.like-button', -1, commentId)
  })


  // submiting a comment

  $('.submit-comment').on('click', (e) => {
    e.preventDefault()
    let $button = $('.submit-comment');
    let data = {comment: {
          'action' : '/comments',
          'user_id': $button.data("user_id"),
          'destination_id': $button.data("destination_id"),
          'content' : $( '.comment-textarea' ).val()
      }
    };

    let posting = $.post('/comments', data);

    posting.done(function(data) {
      let new_comment = new Comment(data)
      $('.comment-div').append(new_comment.toString())
      $('.comment-textarea').val('').attr('placeholder', "leave message here")
      $('#comment-form').hide()
      $('.show-form').show()
      console.log(new_comment.toString())
    });
  })

})

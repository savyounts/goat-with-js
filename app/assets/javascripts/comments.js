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
  const updateLikes = (buttonClass, number) =>{
      e.preventDefault()
      let info = $(buttonClass).data()
      let commentId = info.commentid
      let likes = info.likes + number
      let destinationId = info.destination
      let data = {comment:{
          likes: likes
        }
      }
      let update = $.ajax({
              url: `/comments/${commentId}`,
              type: 'PATCH',
              dataType: "json",
              data: data
            });
      update.done(function(data){
        $(`#comment-${commentId}-likes`).html(likes)
      })
  }

  $('.comment-div').on('click', '.like-button', (e)=>{
    updateLikes('.like-button', 1)
  })

  $('.comment-div').on('click', '.dislike-button', (e)=>{
    updateLikes('.like-button', -1)
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

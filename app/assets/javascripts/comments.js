$( document ).ready(function() {
  // Comment class
  const store = {comments:[]}
  class Comment{
    constructor(data){
      this.id = data.id
      this.content = data.content
      this.likes = 0
      store.comments.push(this)
    }

    toString(){
      return HandlebarsTemplates['comments-template']({comment: this})
    }

    add_like(){
      return ++this.likes
    }

    dislike(){
      if (this.number > 0){
        --this.likes
      }
      return this.likes
    }
  }

// like/dislike functions

function findComment(id){
  return store.comments.find(comment => comment['id'] === id)
}

$('.comment-div').on('click', '.like-button', (e)=>{
  e.preventDefault()
  let info = $('.like-button').data()
  let commentId = info.commentid
  let likes = info.likes + 1
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
})

$('.comment-div').on('click', '.dislike-button', (e)=>{
  e.preventDefault()
  let info = $('.dislike-button').data()
  let commentId = info.commentid
  let likes = info.likes - 1
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
  $('.comment-textarea').val('').attr('placeholder', "leave message here")
  let posting = $.post('/comments', data);

  posting.done(function(data) {
    let new_comment = new Comment(data)
    $('.comment-div').append(new_comment.toString())
    $('#comment-form').hide()
    $('.show-form').show()
    console.log(new_comment.toString())
  });
})

})

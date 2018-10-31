$( document ).ready(function() {
// Comment class
const store = {comments:[]}
class Comment{
    constructor(json){
      this.id =
      this.content =
      this.likes = 0
      store.comments.push(this)
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

$('.like-button').on('click', (e)=>{
  e.preventDefault()
  let commentId = $('.like-button').attr("data-commentid")
  let likedComment = findComment(commentId)
  console.log(likedComment)
  // likedComment.add_like()
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
    let new_comment = HandlebarsTemplates['comments-template']({comment: data})
    $('.comment-div').append(new_comment)
    $('#comment-form').hide()
    $('.show-form').show()
    // new Comment(data)
  });
})

})

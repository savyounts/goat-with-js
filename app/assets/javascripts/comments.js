$( document ).ready(function() {
// Comment class
function creatComment(){
  const store = []
  let commentId = 0

  return class {
    constructor(content){
      this.id = ++commentId
      this.content = content
      this.likes = 0
      store.push(this)
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

}

// like/dislike functions

function findComment(link){
  return store.find(comment => comment['id'] === link.data('commentId'))
}

$('.like-button').on('click', (e)=>{
  e.preventDefault()
  let likedComment = findComment(this)
  likedComment.add_like()
})


// submiting a comment

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

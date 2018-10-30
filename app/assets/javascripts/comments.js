
// Like class
const Like = () => {
  const store = []
  let likeId = 0

  return class {
    constructor(commentId){
      this.id = likeId++
      this.comment = commentId
      this.number = 0
      store.push(this)
    }

    add_like(){
      return ++this.number
    }

    dislike(){
      if (this.number > 0){
        this.number--
      }
      return this.number
    }
  }
}

function findLike(){
  return store.find(like => like.comment === e.dataset('commentId'))
}

// methods to use with likes
function clickLike(){
  let like = findLike()
  if (like){
    like.add_like()
  }else{
    new Like(e.dataset('commentId'))
  }
}

function clickDislike(){
  let like = findLike()
  like.dislike()
}

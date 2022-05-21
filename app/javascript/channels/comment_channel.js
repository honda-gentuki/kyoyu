import consumer from "./consumer"

if(location.pathname.match(/\/posts\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    post_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
      <div class="comment">
        <li class="comment_list">
          <div class="follow-header">
            <div class="user-image">
              if (date.comment.user.image?){
                <a class="comment_user" href="/users/user.id"><img src="data.comment.user.image.url"></a>
              }else{
                <a class="comment_user" href="/users/user.id"><img src="/images/no-image.png"></a>
              }
            </div>
            <div class="follow-right">
              <div class="user-nickname">
                ${data.comment.user.nickname}
              </div>
              <div class="user-introduce">
                ${data.comment.content}
              </div>
            </div>
          </div>
        </li>
      </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  })
}
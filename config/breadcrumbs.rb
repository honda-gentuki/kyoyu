crumb :root do
  link "Home", root_path
end

crumb :posts_pagination do |page|
  link "#{page}ページ目"
  parent :root
end

crumb :user_new do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :user_login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :root
end

crumb :post_show do |post|
  link "投稿詳細", post_path(post)
  parent :root
end

crumb :post_edit do |post|
  link "投稿編集"
  parent :post_show, post
end

crumb :user_show do |user|
  link "#{user.nickname}先生のプロフィール", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "#{user.nickname}先生の編集"
  parent :user_show, user
end

crumb :chat do |user|
  link "チャットページ"
  parent :user_show, user
end

crumb :follows_user do |user|
  link "フォロー一覧"
  parent :user_show, user
end

crumb :followers_user do |user|
  link "フォロワー一覧"
  parent :user_show, user
end

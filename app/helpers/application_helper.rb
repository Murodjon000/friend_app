module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Friend App'
    if page_title.empty?
        base_title
    else
        page_title + ' | ' + base_title
    end
  end

  def like_dislike(post)
    like = Like.find_by(post: post, user: current_user)

    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end
end

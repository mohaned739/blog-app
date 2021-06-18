class HardWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    post = Post.find(id)
    tags = Tag.where(post_id: id)
    comments = Comment.where(post_id: id)
    post.destroy
    tags.destroy
    comments.destroy
  end
end

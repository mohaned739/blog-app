class HardWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    post = @posts.find(id)
    tags = @tags.where(post_id: id).destroy_all
    comments = @comments.where(post_id: id).destroy_all
    post.destroy
  end
end

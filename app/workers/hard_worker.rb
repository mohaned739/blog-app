class HardWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    post = @posts.find(id)
    post.destroy
  end
end

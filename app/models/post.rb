class Post < ApplicationRecord
    belongs_to :user
    validates :title, :body, presence: true
    has_many :comments
    has_many :tags
end

class Post < ApplicationRecord
    belongs_to :user
    validates :title, :body, presence: true
    has_many :comments, dependent: :destroy
    has_many :tags, dependent: :destroy
end

class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true #puts the constraint that there must be a user associated with the micropost
  validates :content, presence: true, length: { maximum: 140}
  default_scope -> { order(created_at: :desc) }
end

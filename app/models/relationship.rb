class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "Event"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end

class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_many :active_relationships, class_name:  "Relationship",
              foreign_key: "user_id",
                dependent: :destroy
    has_many :following, through: :active_relationships, source: :event

    # イベントをフォローする
    def follow(event)
        active_relationships.create(event_id: event.id)
    end

    # イベントをフォロー解除する
    def unfollow(event)
        active_relationships.find_by(event_id: event.id).destroy
    end

    # 現在のイベントがフォローしてたらtrueを返す
    def following?(event)
        following.include?(event)
    end
end

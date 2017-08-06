class Event < ApplicationRecord
     enum course: { "理系": 0, "文系": 1 }
     
     scope :get_by_course, ->(course) {
           where(course: course)
     }
     
     has_many :passive_relationships, class_name:  "Relationship",
     foreign_key: "event_id",
     dependent:   :destroy
     has_many :followers, through: :passive_relationships, source: :user
    
end

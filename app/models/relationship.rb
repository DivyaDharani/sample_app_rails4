class Relationship < ActiveRecord::Base

  belongs_to :follower,class_name: "User"  #follower_id -> foreign key in the Relationship model(for user_id)
  belongs_to :followed,class_name: "User"  #followed_id -> foreign key 

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

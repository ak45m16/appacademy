class Post < ActiveRecord::Base
  validates :name, presence:true
  belongs_to :user
  has_many :comments
end

class Question < ActiveRecord::Base
  attr_accessible :description, :question, :rating, :topic, :user, :user_id
  has_many :answers, :dependent => :destroy
  belongs_to :topic
  belongs_to :user
end

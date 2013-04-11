class Question < ActiveRecord::Base
  attr_accessible :description, :question, :rating, :topic, :user
  has_many :answers
  belongs_to :topic
end

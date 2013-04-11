class Answer < ActiveRecord::Base
  attr_accessible :answer, :description, :question, :rating, :user, :user_id
  belongs_to :question
  belongs_to :user
end

class Answer < ActiveRecord::Base
  attr_accessible :answer, :description, :question, :rating, :user
  belongs_to :question
end

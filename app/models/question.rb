class Question < ActiveRecord::Base
  attr_accessible :description, :question, :rating, :topic, :user, :user_id
  has_many :answers, :dependent => :destroy
  belongs_to :topic
  belongs_to :user

  accepts_nested_attributes_for :answers

  def averageRating
    average = Rating.where('rating_type = ? AND type_id = ?', 'question', self.id).average("value")

    if !average
      average = 0.0
    end
    return average
  end
end

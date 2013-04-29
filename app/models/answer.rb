class Answer < ActiveRecord::Base
  attr_accessible :answer, :description, :question, :rating, :user, :user_id
  belongs_to :question
  belongs_to :user
  validates_format_of :answer, :with => /^[a-z]+$/i

  before_create :upcase_answer
  def upcase_answer
     self.answer.upcase! if self.answer
  end

  def getUCAnswer
    return self.answer.upcase
  end

  def averageRating
    average = Rating.where('rating_type = ? AND type_id = ?', 'answer', self.id).average("value")

    if !average
      average = 0.0
    end
    return average
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :score
  attr_accessible :nick

  has_many :authentications, :dependent => :delete_all
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    self.nick = auth['extra']['raw_info']['name']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  def calculateScore
    score = self.questionScore + self.answerScore
    self.score = score
    return score
  end

  def questionScore
    score = 0
    Question.where('user_id = ?', self.id).each do |q|
      score = score + 3 * (1 + q.averageRating)
    end
    return score
  end

  def answerScore
    score = 0
    Answer.where('user_id = ?', self.id).each do |a|
      score = score + 2 * (1 + a.averageRating)
    end
    return score
  end
end

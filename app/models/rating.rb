class Rating < ActiveRecord::Base
  belongs_to :user
  attr_accessible :rating_type, :type_id, :value, :user_id
end

class Lesson < ApplicationRecord
  belongs_to :user
  has_many :books , dependent: :destroy  
end

class Town < ApplicationRecord
  belongs_to :division
  has_many :users
end

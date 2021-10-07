class Contest < ApplicationRecord
  has_many :tasks
  belongs_to :organizer
end

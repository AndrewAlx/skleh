class Task < ApplicationRecord
  belongs_to :contest

  attr_accessor :query
end

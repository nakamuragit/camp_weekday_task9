class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :memo, presence: true 
  validates :memo, length: {in: 10..30}
end

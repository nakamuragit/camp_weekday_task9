class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :memo, presence: true 
  validates :memo, length: {in: 10..30}
  enum status:{draft:0, published:1, archieved:2}
end

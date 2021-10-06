class Person < ApplicationRecord
  has_many :tickets
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
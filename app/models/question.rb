class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, :body, presence: true
  belongs_to :user
end

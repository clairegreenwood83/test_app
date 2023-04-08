class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: %w[public private archived], message: "%{value} is not a valid status" }, allow_nil: true
end


class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, uniqueness: { scope: :list, message: '[movie, list] pairings should be unique' }
  validates :comment, presence: true, length: { minimum: 6 }
end

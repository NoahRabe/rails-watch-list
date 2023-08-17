class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true

  before_destroy :delete_associated_bookmarks
end

def delete_associated_bookmarks
  bookmarks.destroy_all
end

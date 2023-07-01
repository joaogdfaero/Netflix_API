class Netflix < ApplicationRecord
    scope :year, ->(year) { where('year = ?', year) }
    scope :genre, ->(genre) { where('genre = ?', genre) }
    scope :country, ->(country) { where('country = ?', country) }
end

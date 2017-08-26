class Gadget < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}
  belongs_to :user
  has_many :photos
  has_many :reservations
end

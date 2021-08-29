class Link < ApplicationRecord

  validates :lookup_code, presence: true, uniqueness: true
  validates :original_url, presence: true

end

class Link < ApplicationRecord

  # belongs_to :user

  validates :lookup_code, presence: true, uniqueness: true
  validates :original_url, presence: true
  validate :original_url_format

  def original_url_format
    uri = URI.parse(original_url || '')
    errors.add(:original_url, 'Invalid URL Format') if uri.host.nil?
  end

  def shortened_url
    "http://localhost:3000/s/#{lookup_code}"
  end

end

class Shortener

  attr_reader :url, :link_model, :user

  def initialize(url, user = nil, link_model = Link)
    @url = url
    @user = user
    @link_model = link_model
  end

  def generate_short_link
    link = link_model.find_by(original_url: url, user_id: user.try(:id))
    link || link_model.create(original_url: url, lookup_code: lookup_code, user_id: user.try(:id))
  end

  def lookup_code
    loop do
      code = generate_fresh_code
      break code unless link_model.exists?(lookup_code: code)
    end
  end

  private

  def generate_fresh_code
    SecureRandom.uuid[0..6]
  end
end
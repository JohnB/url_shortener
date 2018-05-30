class ShortenedUrl < ActiveRecord::Base
  SHORT_LENGTH = 8
  VALID_SHORT_CHARACTERS = "ABCDEFGHJKMNPQRSTWXY34679"
  VALIDATOR_REGEXP = /\A[#{VALID_SHORT_CHARACTERS}]+\z/i

  validates :long_url, format: { with: /\Ahttp.*/i, message: "must start with HTTP" }

  validates_uniqueness_of :short_url
  validates_length_of :short_url, in: SHORT_LENGTH..SHORT_LENGTH, message: "wrong length"
  validates :short_url, format: { with: VALIDATOR_REGEXP, message: "invalid characters" }

  before_validation :generate_short_url

  def generate_short_url
    self.short_url ||= VALID_SHORT_CHARACTERS.split('').sample(SHORT_LENGTH).join
  end
end

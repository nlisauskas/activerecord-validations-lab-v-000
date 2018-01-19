class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :validated_clickbait

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def validated_clickbait
    if self.title == nil
      return false
    end
    if self.title.include?(CLICKBAIT[0]) || self.title.include?(CLICKBAIT[1]) || self.title.include?(CLICKBAIT[2]) || self.title.include?(CLICKBAIT[3])
      return true
    else
      errors.add(:title, "Must be clickbait-y")
    return false
    end
  end
end

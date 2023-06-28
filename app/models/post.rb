class Post < ApplicationRecord
    validate :title_must_be_clickbait_y

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    private

    def title_must_be_clickbait_y
      unless title&.include?("Won't Believe") || title&.include?("Secret") || title&.match?(/Top \d+/) || title&.include?("Guess")
        errors.add(:title, "must be clickbait-y")
      end
    end
  end

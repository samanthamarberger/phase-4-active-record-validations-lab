class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :clickbait_y

    def clickbait_y
        clickbait_patterns = [
            /Won't Believe/i,
            /Secret/i,
            /Top \d+/i,
            /Guess/i
        ]

        unless clickbait_patterns.any? { |pattern| pattern.match?(title) }
            errors.add(:title, "is not clickbait-y enough!")
        end
    end
    
end

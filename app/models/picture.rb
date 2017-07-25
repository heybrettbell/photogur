class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, length:{minimum: 3, maximum: 20}
  validates :url, uniqueness: true, presence: true

  def self.pictures_created_in_year(year)
    where("created_at LIKE ?", "%#{year}%")
  end

  def self.three_months_ago
    where("created_at < ?", 3.months.ago)
  end

end

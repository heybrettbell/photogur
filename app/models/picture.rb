class Picture < ApplicationRecord

  def self.pictures_created_in_year(year)
    Picture.where("created_at LIKE ?", "%#{year}%")
  end

  def self.three_months_ago
    Picture.where("created_at < ?", 3.months.ago)
  end

end

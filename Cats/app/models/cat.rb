# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(blue black green blue white yellow orange blonde rainbow) }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests

  CAT_COLORS = %w(blue black green blue white yellow orange blonde rainbow)

  def age
    ((Date.today - self.birth_date)/365.0).floor
  end

  def self.colors
    CAT_COLORS
  end

end

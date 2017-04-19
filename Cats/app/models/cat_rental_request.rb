# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(pending approved denied) }
  validate :does_not_overlap_approved_requests

  belongs_to :cat,
  dependent: :destroy

  def overlapping_requests
    CatRentalRequest.where(cat_id: cat_id).where.not(id: id).
    where('start_date between ? and ? or end_date between ? and ?',
    start_date, end_date, start_date, end_date)
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "pending")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "approved")
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors[:message] << "Can't request for those dates, cat is rented out"
    end
  end

  def approve!
    CatRentalRequest.transaction do
      update_attribute("status", "approved")
      overlapping_pending_requests.each { |rental| rental.update_attribute("status", "denied")}
    end
  end

  def deny!
    update_attribute("status", "denied")
  end

  def pending?
    status == "pending"
  end
end

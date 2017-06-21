class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "Invalid status" }
  validate :does_not_overlap_approved_requests

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_rental_requests: { cat_id: self.cat_id } )
      .where.not("end_date < ? OR start_date > ?", self.start_date, self.end_date)
      .where.not(id: self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(cat_rental_requests: { status: "APPROVED" } )
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors[:request] << "can't overlap with approved requests"
    end
  end

  def approve!
    request = CatRentalRequest.find_by(id: self.id)
    request.update_attributes(status: "APPROVED")

  end


end

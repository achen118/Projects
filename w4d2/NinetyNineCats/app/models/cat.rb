class Cat < ActiveRecord::Base
  CAT_COLORS = %w(black white brown orange)
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: {in: CAT_COLORS, message:"Invalid color" }
  validates :sex, inclusion: { in: %w(M F), message: "Invalid sex" }

  def age
    current_date = Date.new(Time.now.year, Time.now.month, Time.now.day)
    ((current_date - birth_date) / 365).floor
  end

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end

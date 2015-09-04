class Paycheck < ActiveRecord::Base
 validates :start_date, presence: true
 validates :end_date, presence: true
 validates :hr_base, presence: true
 validates :hr_qty, presence: true
end

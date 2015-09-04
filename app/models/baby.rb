class Baby < ActiveRecord::Base
 validates :first_name, presence: true
 validates :dob, presence: true

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end


end

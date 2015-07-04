class Baby < ActiveRecord::Base
 validates :first_name, presence: true
 validates :dob, presence: true
end

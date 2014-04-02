class Email < ActiveRecord::Base
  validates :address, :presence => true
  validates :contact_id, :presence => true

  belongs_to :contact
end

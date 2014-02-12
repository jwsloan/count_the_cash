# @author John Sloan
class Budget < ActiveRecord::Base
  has_many :envelopes, dependent: :destroy
  belongs_to  :user
end

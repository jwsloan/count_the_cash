class Budget < ActiveRecord::Base
  has_many :envelopes, dependent: :destroy
end

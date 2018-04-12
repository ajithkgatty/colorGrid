class User < ApplicationRecord
	has_many :boxes

	accepts_nested_attributes_for :boxes, reject_if: proc { |attributes| attributes[:name].blank? }
end

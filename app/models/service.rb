class Service < ApplicationRecord
  belongs_to :invoice, dependent: :destroy
end

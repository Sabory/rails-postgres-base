# frozen_string_literal: true

class Listing < ApplicationRecord
  STATUS = {
    active: 'active',
    unpublished: 'unpublished'
  }.freeze

  enumerazie :status, in: STATUS

  validates :capital_cents,
            :useful_area,
            :location,
            presence: true

  validates :capital_cents,
            numericality: { greater_than: 0 }
end

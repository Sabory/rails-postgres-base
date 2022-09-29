# frozen_string_literal: true

# == Schema Information
#
# Table name: property_listings
#
#  id               :bigint           not null, primary key
#  capital_cents    :integer          not null
#  capital_currency :string           not null
#  useful_area      :decimal(, )      not null
#  location         :string           not null
#  description      :string
#  bedrooms         :integer
#  url              :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class PropertyListing < ApplicationRecord
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

# frozen_string_literal: true

class CreatePropertyListing < ActiveRecord::Migration[7.0]
  def change
    create_table :property_listings do |t|
      t.integer :capital_cents, null: false
      t.string :capital_currency, null: false
      t.decimal :useful_area, null: false
      t.string :location, null: false
      t.string :description
      t.integer :bedrooms
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end

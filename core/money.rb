# frozen_string_literal: true

module Core
  class Money
    attr_reader :amount, :currency

    def initialize(amount:, currency:)
      @amount = amount
      @currency = currency
    end
  end
end

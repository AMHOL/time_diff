require 'pet_rescue/time_diff/calculators/calendar'
require 'pet_rescue/time_diff/strategy'
require 'pet_rescue/time_diff/strategies/independent'
require 'pet_rescue/time_diff/strategies/reductive'

module PetRescue
  module TimeDiff
    module Strategies
      NotDefinedError = Class.new(StandardError)

      class << self
        def register(identifier, strategy)
          registry[identifier.to_s] = strategy
        end

        def [](identifier)
          registry.fetch(identifier.to_s) do
            raise(
              NotDefinedError,
              "No strategy defined for `#{identifier}'"
            )
          end
        end

        private

        def registry
          @registry ||= {}
        end
      end
    end
  end
end

PetRescue::TimeDiff::Strategies.register(
  :calendar_independent,
  PetRescue::TimeDiff::Strategies::Independent.new(
    PetRescue::TimeDiff::Calculators::Calendar.new
  )
)


PetRescue::TimeDiff::Strategies.register(
  :calendar_reductive,
  PetRescue::TimeDiff::Strategies::Reductive.new(
    PetRescue::TimeDiff::Calculators::Calendar.new
  )
)

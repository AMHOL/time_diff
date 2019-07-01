require 'date'
require 'pet_rescue/time_diff/components'
require 'pet_rescue/time_diff/strategies'
require 'pet_rescue/time_diff/version'

module PetRescue
  module TimeDiff
    module_function

    def call(from, to, components: :all, strategy: :calendar_reductive)
      Strategies[strategy].diff(
        from.to_datetime.new_offset(0),
        to.to_datetime.new_offset(0),
        Components[components]
      )
    end
  end
end

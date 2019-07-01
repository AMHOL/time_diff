module PetRescue
  module TimeDiff
    module Components
      DEFAULT = {
        all: %i(years months weeks days hours minutes seconds).freeze,
        date: %i(years months weeks days).freeze,
        ymd: %i(years months days).freeze,
        time: %i(hours minutes seconds).freeze
      }.freeze
      NotDefinedError = Class.new(StandardError)

      class << self
        def register(identifier, strategy)
          registry[identifier.to_s] = strategy
        end

        def [](identifier)
          registry.fetch(identifier.to_s) do
            raise(
              NotDefinedError,
              "No component keys defined for `#{identifier}'"
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

PetRescue::TimeDiff::Components::DEFAULT.each do |identifier, keys|
  PetRescue::TimeDiff::Components.register(
    identifier,
    keys
  )
end

module PetRescue
  module TimeDiff
    class Strategy
      attr_reader :calculator
      private :calculator

      def initialize(calculator)
        @calculator = calculator
      end
    end
  end
end

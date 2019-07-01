module PetRescue
  module TimeDiff
    module Strategies
      class Independent < Strategy
        def diff(from, to, components)
          result = {
            sign: from > to ? :- : :+
          }
          current, target = [from, to].sort

          calculator.components(components).each_with_object(result) do |(component, fns), accumulator|
            diff = fns[:diff].(current, target)

            if diff > 0
              [diff, diff.pred].each do |step|
                stepped = fns[:next].(current, step)

                if stepped <= target
                  accumulator[component] = step
                  break(1)
                end
              end
            else
              accumulator[component] = 0
            end
          end
        end
      end
    end
  end
end

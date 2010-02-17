require 'puppet'
require 'puppet/parser/ast/branch'

class Puppet::Parser::AST
    class MatchOperator < AST::Branch

        attr_accessor :lval, :rval, :operator

        # Iterate across all of our children.
        def each
            [@lval,@rval].each { |child| yield child }
        end

        # Returns a boolean which is the result of the boolean operation
        # of lval and rval operands
        def evaluate
            lval = @lval.safeevaluate

            if rval.evaluate_match(lval)
                return @operator == "=~"
            else
                return @operator == "!~"
            end
        end

        def initialize(hash)
            super

            raise ArgumentError, "Invalid regexp operator #{@operator}" unless %w{!~ =~}.include?(@operator)
        end
    end
end

require 'term/ansicolor'

module SSHKit

  module Formatter

    class Dot < Abstract

      def write(obj)
        return unless obj === SSHKit::Command
        if obj.finished?
          original_output << (obj.failure? ? c.red('.') : c.green('.'))
        end
      end
      alias :<< :write

      private

      def c
        @c ||= Term::ANSIColor
      end

    end

  end

end

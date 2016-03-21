# encoding: utf-8
# frozen_string_literal: true
# author: Harry Lee

module RuboCop
  module Cop
    module Style
      # This cop checks for uses of `raise e`.
      # @example
      # case e
      # when condition
      #   statement
      # else
      #   raise e
      # end
      class RaiseException < Cop
        MSG = 'Raise strings or constants, not variables.'.freeze

        ALLOWED_TYPES = [:const, :str]

        def on_send(node)
          return unless node.command?(:raise)

          _receiver, _selector, *args = *node

          first_arg, = *args

          add_offense(node, :expression, MSG) unless ALLOWED_TYPES.include?(first_arg.type)
        end
      end
    end
  end
end

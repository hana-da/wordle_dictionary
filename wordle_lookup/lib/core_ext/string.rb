# frozen_string_literal: true

module CoreExt
  module String
    refine ::String do
      def blank?
        empty? || match?(/\A[[:space:]]*\z/)
      end

      # From activesupport-7.0.2.2/lib/active_support/core_ext/string/access.rb
      def first(limit = 1)
        self[0, limit] || raise(ArgumentError, 'negative limit')
      end

      # From activesupport-7.0.2.2/lib/active_support/core_ext/string/filters.rb
      def remove!(*patterns)
        patterns.each do |pattern|
          gsub! pattern, ''
        end

        self
      end
    end
  end
end

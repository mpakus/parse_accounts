require 'date'

module Account
  class View
    class << self
      def render(accounts)
        out = ''
        accounts.keys.sort.each do |account|
          out << format("%s\n%s", account, render_date(accounts[account]))
        end
        out
      end

      def render_date(dates)
        out = ''
        dates.each do |date, types|
          date = Date.parse(date)
          out << format("  %s\n%s", date, render_types(types))
        end
        out
      end

      def render_types(types)
        out = ''
        types.sort.each do |type|
          out << format("    %s\n", type)
        end
        out
      end
    end
  end
end

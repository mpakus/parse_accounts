module Account
  class Import
    def initialize(path)
      @path = path
    end

    def read_dir(path = nil)
      path ||= @path

      Dir[path << '*.txt'].each do |filename|
        account, type, date = parse(filename)
        add(account, type, date) if account && type && date
      end
      list
    end

    private

    TYPES = [:account, :activity, :position, :security]

    def list
      @list ||= {}
    end

    def add(account, type, date)
      type = type.downcase.to_sym
      if !list.key?(account)
        list[account] = {}
      elsif list[account] && list[account][date]
        list[account][date] << type
      else
        list[account][date] = [type]
      end
    end

    def parse(filename)
      types   = TYPES.join('|')
      matches = (/.*(U\d+)_(#{types}+)_(\d+)\.txt/i).match(filename)
      return matches[1], matches[2], matches[3] if matches
    end
  end
end

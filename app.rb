require_relative 'lib/account'

import   = Account::Import.new('./inbox/')
accounts = import.read_dir
puts Account::View.render(accounts)

# frozen_string_literal: true

set :output, './log/cron_whenever.log'

every 5.minute do
  runner 'Costumer.checkPayment'
end

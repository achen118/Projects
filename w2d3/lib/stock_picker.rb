def stock_picker(stocks)
  best_profit = 0
  result = []

  stocks.each_index do |day|
    max_profit_day = stocks[day...stocks.length].index(stocks[day...stocks.length].max) + day
    profit = stocks[day...stocks.length].max - stocks[day]
    if profit > best_profit
      result = [day, max_profit_day]
      best_profit = profit
    end
  end

  result
end

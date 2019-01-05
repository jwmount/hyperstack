class DisplayTicker < HyperComponent

  param    :symbol  # hyperstack will copy the param to @Symbol when it changes
  triggers :cancel  # this is an outgoing event.  You trigger it by calling cancel!

  # when the component mounts (is created) we create a corresponding ticker
  # from our StockTicker store.  We will never within the component change the
  # value of @_ticker so it begins with an underscore

  before_mount { @_ticker = StockTicker.new(@Symbol, 10.seconds) }

  # The status helper method renders some bootstrap columns depending on
  # the state of the ticker status.  Internal to each StockTicker state
  # will be mutated, causing the component to rerender, and displaying new data.
  # line 1834 in /Users/john/DEVO/hyperstack/ruby/examples/misc/stock-tickers-2/node_modules/jss-nested/benchmark/fixtures/modified-bootstrap.json:

  def status
    case @_ticker.status
    when :loading
      BS::Col(sm: 10) { 'loading...' }
    when :success
      BS::Col(class: 'text-highlite', sm: 1) { 'price' }
      BS::Col(class: 'text-highlite', sm: 1) { '$%.2f' % @_ticker.price }  #tag at line 1832
      BS::Col(sm: 2) { "at #{@_ticker.time.strftime('%I:%M:%S')}" }
    when :failed
      BS::Col(sm: 4) { "failed to get quote: #{@_ticker.reason}" }
    end
  end

  # Render the ticker.  Most of the work is done in the status method, but
  # here we attach a close button using the BS `close` class (shown by an X)
  # when the close button is clicked we trigger the `cancel` event.

  render do
    BS::Row() do
      BS::Col(sm: 1) { @Symbol.upcase }
      status
      BS::Col(sm: 1) do
        BS::Button(class: :close) { "\u00D7" }
        .on(:click) { cancel! } unless @_ticker.status == :loading
      end
    end
  end
end

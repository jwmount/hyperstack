require 'opal'
require 'hyper-react'
if React::IsomorphicHelpers.on_opal_client?
  require 'opal-jquery'
  require 'browser/delay'
end
require_tree './components'

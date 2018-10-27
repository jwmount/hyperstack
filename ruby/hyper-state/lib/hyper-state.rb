require 'set'
require 'hyperstack-config'
Hyperstack.import 'hyper-state'
require 'hyperstack/internal/callbacks'
require 'hyperstack/internal/auto_unmount'

require 'hyperstack/internal/state/mapper'
require 'hyperstack/internal/auto_unmount'
require 'hyperstack/internal/auto_unmount'
require 'hyperstack/state/observable'
require 'hyperstack/state/observer'
require 'hyperstack/state/version'

if RUBY_ENGINE != 'opal'
  require 'opal'
  Opal.append_path(File.expand_path('../', __FILE__).untaint)
end

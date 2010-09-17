
class XiSearch < Rails::Engine
end

ActiveSupport.on_load(:active_record) do
  require 'xi-search/models'
  extend XiSearch::ModelHelpers
end


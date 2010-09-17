
class XiSearch < Rails::Engine

  AvailableModels = []

  def self.use_model(model, options = {})
    AvailableModels << { :model => model, :options => options }
  end

  config.to_prepare do
    AvailableModels.clear
    Rails.application.railties.engines.each do |engine|
      search_config = engine.root.join("config", "search.rb")
      if search_config.exist?
        load search_config
      end
    end
  end

end

ActiveSupport.on_load(:active_record) do
  require 'xi-search/models'
  include XiSearch::ModelHelpers
end

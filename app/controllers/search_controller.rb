class SearchController < ApplicationController

  def index
    @groups = []
    XiSearch::AvailableModels.each do |model|
      results = model.with_words(params[:q]).limit(6).all

      if results.size > 0
        @groups << {
          :model => model.kind_of?(ActiveRecord::Relation) ? model.klass : model,
          :show_more => (results.size > 5),
          :items => results[0, 5]
        }
      end
    end
  end

end

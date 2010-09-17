module XiSearch::ModelHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    # TODO Use MakeTextSearch when finishied
    def has_text_search(*fields)
      return @has_text_search if fields.empty?
      @has_text_search ||= []
      @has_text_search.concat fields.map {|field_name| field_name.to_s }

      @has_text_search
    end

    def has_text_search?
      !!@has_text_search
    end

    def with_words(words)
      fields = @has_text_search || columns.map {|column| column.text? ? column.name : nil }.compact
      query_by_word = fields.map {|field| "#{connection.quote_column_name field} ILIKE :word" }.join(" OR ")

      words.to_s.split.inject(self) {|query, word| query.where(query_by_word, :word => "%#{word}%") }
    end

  end

  def search_label
    %w(name title label to_param).each do |field_name|
      if respond_to?(field_name)
        return send(field_name)
      end
    end
  end

end

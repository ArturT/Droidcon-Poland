class BasePresenter
  def self.as_json_array(collection)
    collection.map { |record| as_json(record) }
  end
end

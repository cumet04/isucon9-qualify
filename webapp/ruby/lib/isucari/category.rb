module Isucari
  class Category
    def initialize(db)
      @db = db
    end

    def all
      data.values
    end

    def find(id)
      data[id]
    end

    def children_for(parent_id)
      @children_for ||= {}
      @children_for[parent_id] ||= data.values.select { |c| c["parent_id"] == parent_id }
    end

    def set_db(db_caller)
      @db_caller = db_caller
    end

    private

    def data
      @data ||= begin
          query = [
            "SELECT c.id, c.parent_id, c.category_name, p.category_name as parent_category_name FROM `categories` as c",
            "LEFT OUTER JOIN `categories` as p ON c.parent_id = p.id",
          ].join(" ")
          @db.xquery(query).to_h do |line|
            [
              line["id"],
              {
                "id" => line["id"],
                "parent_id" => line["parent_id"],
                "category_name" => line["category_name"],
                "parent_category_name" => line["parent_category_name"],
              },
            ]
          end
        end
    end
  end
end

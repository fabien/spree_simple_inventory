Variant.class_eval do
  
  scope :master, where(:is_master => true)
  
  scope :name_contains,     lambda { |n| joins(:product).where("products.name #{LIKE} ?", "%#{n}%") }
  scope :sort_by_name_asc,  lambda { joins(:product).order("products.name ASC")  }
  scope :sort_by_name_desc, lambda { joins(:product).order("products.name DESC") }
  
  search_methods :name_contains, :sort_by_name
  
end
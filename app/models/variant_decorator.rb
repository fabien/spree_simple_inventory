module Spree
  class Variant < ActiveRecord::Base
    
    attr_accessible :count_on_hand
  
    scope :master, where(:is_master => true)
  
    scope :name_contains,     lambda { |n| joins(:product).where("products.name #{LIKE} ?", "%#{n}%") }
    scope :sort_by_name_asc,  lambda { joins(:product).order("products.name ASC")  }
    scope :sort_by_name_desc, lambda { joins(:product).order("products.name DESC") }
  
  end
end
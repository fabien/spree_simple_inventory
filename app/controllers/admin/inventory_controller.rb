class Admin::InventoryController < Admin::BaseController
  
  include ActionView::Helpers::NumberHelper
  
  def index
    params[:search] ||= {}
    params[:search][:meta_sort] ||= "name.asc"
    @filtered = params[:search].keys.size > 1
    @search = (@filtered ? Variant : Variant.master).metasearch(params[:search])
    @items  = @search.relation.includes(:product => :variants, :option_values => {}).
                       page(params[:page]).per(Spree::Config[:admin_products_per_page])
  end
  
  def update_inline
    if (v = Variant.find(params[:id])) && v.update_attributes(params[:param] => params[:value])
      render :text => case params[:param]
        when 'price'          then number_with_precision(v.price, :precision => 2)
        when 'cost_price'     then number_with_precision(v.cost_price, :precision => 2)
        when 'count_on_hand'  then v.count_on_hand
        else params[:value]
      end
    else
      render :text => params[:value]
    end
  end
  
end
Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "inventory_admin_sub_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs'], #admin_product_sub_tabs[data-hook]",
                     :text => "<%= tab(:inventory, :label => 'inventory_management') %>",
                     :disabled => false)

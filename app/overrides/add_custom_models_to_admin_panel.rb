Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'add_custom_models_to_admin_panel',
  insert_bottom: "[data-hook='admin_tabs']",
  text: '
<% if can? :admin, Spree::CustomProduct %>
  <ul class="nav nav-sidebar">
    <%= main_menu_tree Spree.t(:custom_products), icon: "th-large", sub_menu: "custom_product", url: "#sidebar-custom-products" %>
  </ul>
<% end %>

<% if can? :admin, Spree::CustomCategory %>
  <ul class="nav nav-sidebar">
    <%= main_menu_tree Spree.t(:custom_categories), icon: "list", sub_menu: "custom_category", url: "#sidebar-custom-categories" %>
  </ul>
<% end %>
'
)
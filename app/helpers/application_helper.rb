module ApplicationHelper
  def render_sidebar
    unless on_order_show?
      render "layouts/sidebar"
    end
  end

  def render_shopping_cart
    render 'orders/shopping_cart' if current_order.order_items.present?
  end

  def options_for_table_select
    tables = (1..9).to_a.map { |n|  ["Table #{n}", n] }
    options_for_select(tables)
  end

  def on_order_show?
    controller_name == "orders" && action_name == "show"
  end

  def user_has_credit_card?
    current_user.payments.present?
  end
end

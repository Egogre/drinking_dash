module MeritHelper
  def dash_badge
    if current_user && self.admin?
      if current_user.unique_badge_add(4) 
        badge_flash
      end
    end
  end

  def spender_badge
    if current_user && current_user.orders.count > 1
      current_user.rm_badge(3)
      if current_user.unique_badge_add(3)
        badge_flash
      end
    end
  end

  def items_ordered_count
    count = 0
    current_user.orders.each do |order|
      count += order.order_items.count
    end
    count
  end

  def badge_flash
    flash[:alert] = "You got a badge, son: #{current_user.badges.last.name.gsub("-", " ").upcase}".html_safe
    # flash[:alert] = current_user.badges.last.custom_fields
  end
end

module MeritHelper

  def newbie_badge
    if current_user
      if badge_them(1) then badge_flash end
    end
  end

  def dash_badge
    if current_user && self.admin?
      if badge_them(4) then badge_flash end
    end
  end

  def spender_badge
    if current_user && current_user.orders.count > 1
      if badge_them(3) then badge_flash end
    end
  end

  def hipster_badge
    if current_user && so_many_peebers >= 1
      if badge_them(2) then badge_flash end
    end
  end

### User Order Logic for Badges Below

  def items_ordered_count
    count = 0
    current_user.orders.each do |order|
      count += order.order_items.count
    end
    count
  end

  def so_many_peebers
    status = 0
    current_order.order_items.each do |order_item|
      if order_item.drink.name == "PBR" && order_item.quantity > 5
        status += 1
      end
    end
    status
  end

  def badge_them(id)
    current_user.unique_badge_add(id)
  end

  def badge_flash
    flash[:alert] = "You got a badge! #{current_user.badges.last.name.gsub("-", " ").upcase}".html_safe
    # flash[:alert] = current_user.badges.last.custom_fields
  end
end

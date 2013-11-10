categories =  [ { drink_type: "beer", image_url: "beer.png"},
       { drink_type: "cocktails", image_url: "cocktail.png"},
       { drink_type: "wine", image_url: "cask.png"},
       { drink_type: "shots", image_url: "shotglass.png"},
       { drink_type: "soft drinks", image_url: "soda.png"}]

drinks = [ { name: "PBR", description: "The best beer ever!", price: 7.99, category_id: 1 },
     { name: "Guinness", description: "Brilliant!", price: 5.00, category_id: 1 },
     { name: "Yeti Imperial Stout", description: "Greatest Great Divide beer!", price: 7.98, category_id: 1 },
     { name: "Coors", description: "The banquet beer.", price: 1.00, category_id: 1 },
     { name: "Coors Light", description: "Taste the Rockies!", price: 1.00, category_id: 1 },
     { name: "Sam Adam's Octoberfest", description: "We have this all year round.", price: 5.50, category_id: 1 },
     { name: "Pisco Sour", description: "Eggy!.", price: 6.95, category_id: 2 },
     { name: "RBV", description: "A sweet and sour energy drink mixed with local organic grain based spirits based spirits.", price: 6.95, category_id: 2 },
     { name: "Cuba Libre", description: "Tradional American cola mixed with a shot of silver rum", price: 4.95, category_id: 2 },
     { name: "An Old Fashioned", description: "The world famous drink served with either rye or bourben.", price: 12.00,  category_id: 2 },
     { name: "Pinot Gris", description: "Fancy Wine", price: 7.95, category_id: 3 },
     { name: "Merlot", description: "\"I refuse to drink Merlot\" - Paul Giamatti", price: 7.95, category_id: 3 },
     { name: "House Red", description: "It's Red", price: 5.95, category_id: 3 },
     { name: "House White", description: "It's not Red", price: 5.95, category_id: 3 },
     { name: "Kamikaze", description: "Voted best shot by the Zeta Theta Theta Sisters.", price: 3.75, category_id: 4},
     { name: "Fireball", description: "It taste like Big Red gum", price: 3.75, category_id: 4},
     { name: "Yeager Bomb", description: "German liquorice liquor dropped into our sweet and sour energy drink, made famous by Chuck Yeager", price: 3.75, category_id: 4},
     { name: "Diet Coke", description: "Its Diet Coke", price: 1.00, category_id: 5 },
     { name: "Coffee", description: "Best Thing Ever", price: 1.00, category_id: 5 },
     { name: "Bottled Water", description: "Don't Drink Tap.", price: 10.00, category_id: 5 }]

users = [ { name: "Don", email: "madman@example.com", password: "password", password_confirmation: "password"},
 { name: "Jim", email: "lizard.king@example.com", password: "password", password_confirmation: "password"},
 { name: "F. Scott", email: "DaGreatFtzy@example.com", password: "password", password_confirmation: "password"},
 { name: "Franklin Webber", email: "demo+franklin@jumpstartlab.com", password: "password", password_confirmation: "password"},
 { name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "j3"},
 { name: "Katrina Owen", email: "demo+katrina@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "kytrinyx", admin_role: true }]

categories.each do |category|
  Category.find_or_create_by_drink_type!(category)
end

drinks.each do |drink|
  Drink.find_or_create_by_name_and_description!(drink)
end

users.each do |user|
  User.find_or_create_by_email(user)
end

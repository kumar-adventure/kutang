class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :name, :parent_id

  BUY_AND_SELL_SUB_CATEGORY = ["Art, Collectibles", "Baby items", "Bikes", "Books", "Business industrial",
                             "Cameras Camcorders", "CDs,DVDs, Blu-ray", "Clothing", "Computers", "Computer accessories",
                             "Electronics", "Furniture", "Garage sales", "Health special need", "Hobbies, Crafts",
                             "Home appliances", "Home indoor", "Home outdoor", "Home renovation materials","Phones",
                             "iPods, mp3, headphones","Jwellery, watches", "Musical instruments", "Sporting, goods,exercise",
                             "Tickets", "Tools", "Toys, games", "Video games, consoles", "Others"]

  SERVICES_SUB_CATEGORY = ["Childcare, Nanny", "Cleaners, Cleaning", "Entertaiment", "Finacial, legal", "Fitness personal trainer",
                          "Health, beauty", "Moving Storage", "Music lessions", "Photography, video", "Skilled trades",
                          "Tutors languages", "Wedding", "Travel, Vacations", "Others"]

  CAR_AND_VEHICLES_SUB_CATEGORY = ["Car & Trucks", "Car (under/over $5k)", "SUVs/trucks/vans", "Classic cars", "Auto parts, tires",
                                  "Automotive services", "Motorcycles", "ATVs, snomobiles", "Boats watercrafts","RVs, campers, trailers",
                                  "Heavy equipment", "Other"]

  PETS_SUB_CATEGORY = ["Accessories", "Animal, pet services", "Birds for sale", "Cats, kittens for sale", "Dogs, puppies for sale",
                      "Livestock for sale", "Lost & found - new", "Other pets for sale", "To give or donate", "Other"]

  COMMUNITY_SUB_CATEGORY = ["Activities, groups", "Artists, musicians", "Classes, lessons", "Discussions", "Events",
                            "Friendship, networking", "Long lost relationships", "Lost & found", "Missed connections", "Rideshare",
                            "Volunteers", "Other"]

  REAL_ESTATE_SUB_CATEGORY = ["For rent:", "Apartments, condos", "House rental", "Room rental, Roommates", "Short term rentals",
                              "Commercial, office space", "Vacation rentals", "Storage, parking", "For sale:", "Houses for sale",
                              "Condos for sale", "Land for sale", "Real estate services", "Other"]

  JOBS_SUB_CATEGORY = ["Accounting, mgmt", "Child care", "Bar, food, hospitality", "Cleaning, housekeeper", "Construction, trades",
                       "Customer service", "Driver, security", "General labour", "Graphic, web design", "Hair stylist, salon",
                       "Office mgr, receptionist", "Part time, students", "Programmers, computer", "Sales, retail sales",
                       "TV, media, fashion", "Other"]

  RESUMES_SUB_CATEGORY = ["Child care", "Construction, trades", "General labour", "(more categories...)"]

  belongs_to :category

end

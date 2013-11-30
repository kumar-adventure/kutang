task :insert_category => :environment do
  Category::CATEGORY.each do |cat|
    Category.create(name: cat)
  end
end

task :insert_buy_and_sell_sub_category => :environment do
  category = Category.where(name: "Buy and Sell").first
  Subcategory::BUY_AND_SELL_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_services_sub_category => :environment do
  category = Category.where(name: "Services").first
  Subcategory::SERVICES_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_car_and_vehicles_sub_category => :environment do
  category = Category.where(name: "Cars and Vehicles").first
  Subcategory::CAR_AND_VEHICLES_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_pets_sub_category => :environment do
  category = Category.where(name: "Pets").first
  Subcategory::PETS_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_community_sub_category => :environment do
  category = Category.where(name: "Community").first
  Subcategory::COMMUNITY_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_real_estate_sub_category => :environment do
  category = Category.where(name: "Real Estate").first
  Subcategory::REAL_ESTATE_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

task :insert_jobs_sub_category => :environment do
  category = Category.where(name: "Jobs").first
  Subcategory::JOBS_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

 task :insert_resumes_sub_category => :environment do
  category = Category.where(name: "Resumes").first
  Subcategory::RESUMES_SUB_CATEGORY.each do |sub_cat|
    category.subcategories.create(name: sub_cat)
  end
end

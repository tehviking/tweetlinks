namespace :shared_items do
  desc "Update shared_items for all users"
  task :refresh_all => :environment do |t|
    puts "Starting..."
    User.all.to_a.each do |user|
      puts "Updating shared item for user: #{user.name}"
      SharedItem.import_for_user(user)
      puts "Done."
    end
  end
end

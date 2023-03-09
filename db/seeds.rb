# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

3.times do
  my_category = Category.new(title: Faker::Book.genre)
  my_category.save
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward,
                      image: Faker::Avatar.image)
    my_task.category_id = my_category.id
    my_task.save
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
Task.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('tasks')
Email.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('emails')

require 'faker'

3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward,
                      image: Faker::Avatar.image)
    my_task.category_id = my_category.id
    my_task.save
  end
end

5.times do
  my_email = Email.create(object: Faker::Book.title,
                        body: Faker::Hipster.paragraph)
end
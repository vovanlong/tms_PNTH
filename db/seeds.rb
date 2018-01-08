# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Tran Van Uy",
             email: "vanuy113@gmail.com",
             password: "123456",
             roles: 2)

50.times do |n|
  Course.create!(name: "Example Course #{n+1}",
                 description: "lorem ipsum #{n+1}",
                 status: 1,
                 start_at: Time.zone.now,
                 end_at: Time.zone.now)

  Subject.create!(name: "Example Subject #{n+1}",
                  description: "subject lorem ipsum #{n+1}",
                  duration: n)

  User.create!(name: "Example User #{n+1}",
               email: "example#{n+1}@gmail.com",
               password: "123456")
end

20.times do |n|
  CourseSubject.create!(course_id: 1,
                        subject_id: Subject.all.ids.sample,
                        deadline: Time.zone.now)

  UserCourse.create!(course_id: 1,
                     user_id: User.all.ids.sample,
                     status: 1)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Teacher.destroy_all
Course.destroy_all
Student.destroy_all

teacher_1 = Teacher.create!(
    email: "linus@gmail.com",
    first_name: "Linus",
    last_name: "Torvalds",
    password: "123456"
)
student_1 = Student.create!(
    email: "bill@gmail.com",
    first_name: "William",
    last_name: "Wallace",
    password: "123456"
)
student_2 = Student.create!(
    email: "john@gmail.com",
    first_name: "John",
    last_name: "Travolta",
    password: "123456"
)

course_1 = Course.create!(
name: "Introduction to Python", 
description: "This course introduces students to the Python programming language as it relates to computer networking.", 
day: "Tuesday", 
time: "6:30pm to 9:30pm", 
date: "June 9 to December 22",
teacher_id: teacher_1.id
)
course_2 = Course.create!(
name: "Networking Fundamentals", 
description: "Learn the structure behind computer networks, build simple LANs, configure routers and switches, and implement IP addressing schemes.", 
day: "Wednesday", 
time: "6:30pm to 9:30pm", 
date: "June 10 to December 23",
teacher_id: teacher_1.id
)
course_3 = Course.create!(
name: "Linux and Powershell", 
description: "Configure software and hardware using the command line environment in both the Windows and MacIntosh environments.", 
day: "Thursday", 
time: "6:30pm to 9:30pm", 
date: "June 11 to December 24",
teacher_id: teacher_1.id
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User Create
User.create(username: 'admin', password: 'admin')
User.create(username: 'user1', password: 'pass1')
User.create(username: 'user2', password: 'pass2')
User.create(username: 'user3', password: 'pass3')
User.create(username: 'user4', password: 'pass4')
User.create(username: 'user5', password: 'pass5')

# Author Create
author_1 = Author.create(first_name: 'Christian', last_name: 'Hellsten')
author_2 = Author.create(first_name: 'Jarkko', last_name: 'Laine')
author_3 = Author.create(first_name: 'Michael', last_name: 'Hartl')
author_4 = Author.create(first_name: 'Ronald L.', last_name: 'Graham')
author_5 = Author.create(first_name: 'Donald E.', last_name: 'Knuth')
author_6 = Author.create(first_name: 'Oren', last_name: 'Patashnik')
author_7 = Author.create(first_name: 'Pang-Ning', last_name: 'Tan')
author_8 = Author.create(first_name: 'Michael', last_name: 'Steinbach')
author_9 = Author.create(first_name: 'Vipin', last_name: 'Kumar')
author_10 = Author.create(first_name: 'David Money', last_name: 'Harris')
author_11 = Author.create(first_name: 'Sarah L.', last_name: 'Harris')
author_12 = Author.create(first_name: 'David A.', last_name: 'Patterson')
author_13 = Author.create(first_name: 'John L.', last_name: 'Hennessy')
author_14 = Author.create(first_name: 'Stanley B.', last_name: 'Lippman')
author_15 = Author.create(first_name: 'Josee', last_name: 'Lajoie')
author_16 = Author.create(first_name: 'Barbara E.', last_name: 'Moo')
author_17 = Author.create(first_name: 'Kamalmeet', last_name: 'Singh')
author_18 = Author.create(first_name: 'Adrian', last_name: 'Ianculescu')
author_19 = Author.create(first_name: 'Lucian-Paul', last_name: 'Torje')
author_20 = Author.create(first_name: 'Thomas H.', last_name: 'Cormen')
author_21 = Author.create(first_name: 'Charles E.', last_name: 'Leiserson')
author_22 = Author.create(first_name: 'Ronald L.', last_name: 'Rivist')
author_23 = Author.create(first_name: 'Clifford', last_name: 'Stein')
author_24 = Author.create(first_name: 'Alfred V.', last_name: 'Aho')
author_25 = Author.create(first_name: 'Monica S.', last_name: 'Lam')
author_26 = Author.create(first_name: 'Ravi', last_name: 'Serhi')
author_27 = Author.create(first_name: 'Jeffery D.', last_name: 'Ullman')
author_28 = Author.create(first_name: 'Kip', last_name: 'Irvine')
author_29 = Author.create(first_name: 'Bruce', last_name: 'Eckel')

# Publisher Create
publisher_1 = Publisher.create(name: 'Apress')
publisher_2 = Publisher.create(name: 'Post & Telecom Press')
publisher_3 = Publisher.create(name: 'China Machine Press')
publisher_4 = Publisher.create(name: 'Publishing House of Electronics Industry')

# Book Create
Book.create(title: 'Beginning Ruby on Rails E-Commerce', 
						authors: [author_1, author_2], publisher: publisher_1, 
						published_at: "2020-12-30 15:53:00", isbn: "9787115174499", 
						blurb: "Standing on Shoulders of Giants", page_count: 329, price: 49.0)

Book.create(title: 'Ruby on Rails Tutorial Fourth Edition', 
						authors: [author_3], publisher: publisher_2, 
						published_at: "2020-12-31 15:53:00", isbn: "9787115466402", 
						blurb: "Learn Web Development with Rails", page_count: 531, price: 129.0)

Book.create(title: 'Concrete Mathematics', 
						authors: [author_4, author_5, author_6], publisher: publisher_2, 
						published_at: "2020-3-1 15:53:00", isbn: "9787115308108", 
						blurb: "A Foundation for Computer Science, Second Edition",
						page_count: 564, price: 99.0)

Book.create(title: 'Introduction to Data Mining', 
						authors: [author_7, author_8, author_9], publisher: publisher_2, 
						published_at: "2020-8-1 15:53:00", isbn: "9787115241009", 
						blurb: "Standing on Shoulders of Giants",
						page_count: 463, price: 69.0)


Book.create(title: 'Digital Design and Computer Architecture', 
						authors: [author_10, author_11], publisher: publisher_3, 
						published_at: "2018-9-1 15:53:00", isbn: "9787111534518", 
						blurb: "Second Edition",
						page_count: 480, price: 89.0)
						

Book.create(title: 'Computer Organization and Design', 
						authors: [author_12, author_13], publisher: publisher_3, 
						published_at: "2018-11-1 15:53:00", isbn: "9787111504825", 
						blurb: "The Hardware/Software Interface Fifth Edition",
						page_count: 536, price: 99.0)


Book.create(title: 'C++ Primer', 
						authors: [author_14, author_15, author_16], publisher: publisher_4, 
						published_at: "2018-10-1 15:53:00", isbn: "9787121155352", 
						blurb: "Fifth Edition",
						page_count: 838, price: 128.0)


Book.create(title: 'Design Patterns and Best Practices in Java', 
						authors: [author_17, author_18, author_19], publisher: publisher_3, 
						published_at: "2019-10-1 15:53:00", isbn: "9787111629436", 
						blurb: "Best in Java",
						page_count: 206, price: 79.0)


Book.create(title: 'Introduction to Algorithms', 
						authors: [author_20, author_21, author_22, author_23], publisher: publisher_3, 
						published_at: "2013-1-1 15:53:00", isbn: "97871111407010", 
						blurb: "Third Edition",
						page_count: 780, price: 128.0)


Book.create(title: 'Compilers Principles, Techniques and Tools', 
						authors: [author_24, author_25, author_26, author_27], publisher: publisher_3, 
						published_at: "2009-1-1 15:53:00", isbn: "9787111251257", 
						blurb: "Second Edition",
						page_count: 631, price: 89.0)


Book.create(title: 'Assembly Language for x86 Processors', 
						authors: [author_28], publisher: publisher_3, 
						published_at: "2016-4-1 15:53:00", isbn: "9787111530367", 
						blurb: "Seventh Edition",
						page_count: 547, price: 99.0)


Book.create(title: 'Thinking in Java', 
						authors: [author_29], publisher: publisher_3, 
						published_at: "2019-5-1 15:53:00", isbn: "9787111213826", 
						blurb: "Fourth Edition",
						page_count: 880, price: 108.0)
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
author_30 = Author.create(first_name: 'Van Draanen', last_name: 'Wendelin')
author_31 = Author.create(first_name: 'Cixin', last_name: 'Liu')
author_32 = Author.create(first_name: 'Khaled', last_name: 'Hosseini')
author_33 = Author.create(first_name: 'Jane', last_name: 'Austen')
author_34 = Author.create(first_name: 'Walter', last_name: 'Isaacson')
author_35 = Author.create(first_name: 'Ashlee', last_name: 'Vance')
author_36 = Author.create(first_name: 'Sir Winston S.', last_name: 'Churchill')
author_37 = Author.create(first_name: 'Adam', last_name: 'Smith')
author_38 = Author.create(first_name: 'Spencer', last_name: 'Johnson')
author_39 = Author.create(first_name: 'John', last_name: 'Carreyrou')

# Publisher Create
publisher_1 = Publisher.create(name: 'Apress')
publisher_2 = Publisher.create(name: 'Post & Telecom Press')
publisher_3 = Publisher.create(name: 'China Machine Press')
publisher_4 = Publisher.create(name: 'Publishing House of Electronics Industry')
publisher_5 = Publisher.create(name: 'Pan Macmillan')
publisher_6 = Publisher.create(name: 'Head of Zeus')
publisher_7 = Publisher.create(name: 'Penguin Random House US')
publisher_8 = Publisher.create(name: 'Vintage Classics')
publisher_9 = Publisher.create(name: 'Simon Schuster')
publisher_10 = Publisher.create(name: 'HarperCollins US')
publisher_11 = Publisher.create(name: 'Bantam Books')

# Category Create
category_1 = Category.create(name: "Computer Science")
category_2 = Category.create(name: "Literature")
category_3 = Category.create(name: "Biographies")
category_4 = Category.create(name: "Management")

# Book Create
Book.create(title: 'Beginning Ruby on Rails E-Commerce', 
						authors: [author_1, author_2], publisher: publisher_1, 
						published_at: "2020-12-30 15:53:00", category: category_1, isbn: "9787115174499", 
						blurb: "Standing on Shoulders of Giants", page_count: 329, price: 49.0)

Book.create(title: 'Ruby on Rails Tutorial Fourth Edition', 
						authors: [author_3], publisher: publisher_2, 
						published_at: "2020-12-31 15:53:00", category: category_1, isbn: "9787115466402", 
						blurb: "Learn Web Development with Rails", page_count: 531, price: 129.0)

Book.create(title: 'Concrete Mathematics', 
						authors: [author_4, author_5, author_6], publisher: publisher_2, 
						published_at: "2020-3-1 15:53:00", category: category_1, isbn: "9787115308108", 
						blurb: "A Foundation for Computer Science, Second Edition",
						page_count: 564, price: 99.0)

Book.create(title: 'Introduction to Data Mining', 
						authors: [author_7, author_8, author_9], publisher: publisher_2, 
						published_at: "2020-8-1 15:53:00", category: category_1, isbn: "9787115241009", 
						blurb: "Standing on Shoulders of Giants",
						page_count: 463, price: 69.0)


Book.create(title: 'Digital Design and Computer Architecture', 
						authors: [author_10, author_11], publisher: publisher_3, 
						published_at: "2018-9-1 15:53:00", category: category_1, isbn: "9787111534518", 
						blurb: "Second Edition",
						page_count: 480, price: 89.0)
						

Book.create(title: 'Computer Organization and Design', 
						authors: [author_12, author_13], publisher: publisher_3, 
						published_at: "2018-11-1 15:53:00", category: category_1, isbn: "9787111504825", 
						blurb: "The Hardware/Software Interface Fifth Edition",
						page_count: 536, price: 99.0)


Book.create(title: 'C++ Primer', 
						authors: [author_14, author_15, author_16], publisher: publisher_4, 
						published_at: "2018-10-1 15:53:00", category: category_1, isbn: "9787121155352", 
						blurb: "Fifth Edition",
						page_count: 838, price: 128.0)


Book.create(title: 'Design Patterns and Best Practices in Java', 
						authors: [author_17, author_18, author_19], publisher: publisher_3, 
						published_at: "2019-10-1 15:53:00", category: category_1, isbn: "9787111629436", 
						blurb: "Best in Java",
						page_count: 206, price: 79.0)


Book.create(title: 'Introduction to Algorithms', 
						authors: [author_20, author_21, author_22, author_23], publisher: publisher_3, 
						published_at: "2013-1-1 15:53:00", category: category_1, isbn: "97871111407010", 
						blurb: "Third Edition",
						page_count: 780, price: 128.0)


Book.create(title: 'Compilers Principles, Techniques and Tools', 
						authors: [author_24, author_25, author_26, author_27], publisher: publisher_3, 
						published_at: "2009-1-1 15:53:00", category: category_1, isbn: "9787111251257", 
						blurb: "Second Edition",
						page_count: 631, price: 89.0)


Book.create(title: 'Assembly Language for x86 Processors', 
						authors: [author_28], publisher: publisher_3, 
						published_at: "2016-4-1 15:53:00", category: category_1, isbn: "9787111530367", 
						blurb: "Seventh Edition",
						page_count: 547, price: 99.0)


Book.create(title: 'Thinking in Java', 
						authors: [author_29], publisher: publisher_3, 
						published_at: "2019-5-1 15:53:00", category: category_1, isbn: "9787111213826", 
						blurb: "Fourth Edition",
						page_count: 880, price: 108.0)


Book.create(title: 'Flipped', 
						authors: [author_30], publisher: publisher_5, 
						published_at: "2019-2-1 15:53:00", category: category_2, isbn: "9781529013245", 
						blurb: "A sweet story",
            page_count: 212, price: 30)
            

Book.create(title: 'Three Body - Death\'s end', 
						authors: [author_31], publisher: publisher_6, 
						published_at: "2017-5-4 15:53:00", category: category_2, isbn: "9781784971656", 
						blurb: "A popular Scientific Novel",
            page_count: 608, price: 69)
            

Book.create(title: 'The Kite Runner', 
						authors: [author_32], publisher: publisher_7, 
						published_at: "2013-3-1 15:53:00", category: category_2, isbn: "9781594632204", 
						blurb: "A novel that deserves everyone to read",
            page_count: 416, price: 64)


Book.create(title: 'Pride and Prejudice', 
						authors: [author_33], publisher: publisher_8, 
						published_at: "2014-6-26 15:53:00", category: category_2, isbn: "9780099589334", 
						blurb: "The best-loved book by our best-loved novelist",
            page_count: 387, price: 46)
            

Book.create(title: 'Steve Jobs: A Biography', 
						authors: [author_34], publisher: publisher_9, 
						published_at: "2011-10-24 15:53:00", category: category_3, isbn: "9781451648539", 
						blurb: "From the author of the bestselling biographies of Benjamin Franklin and Albert Einstein, This is the Exclusive biography of Steve Jobs.",
            page_count: 630, price: 114)


Book.create(title: 'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', 
						authors: [author_35], publisher: publisher_10, 
						published_at: "2015-5-19 15:53:00", category: category_3, isbn: "9780062301239", 
						blurb: "Elon Musk is the most daring entrepreneur of our time",
            page_count: 400, price: 244)
            

Book.create(title: 'Churchill: The Power of Words', 
						authors: [author_36], publisher: publisher_11, 
						published_at: "2014-5-8 15:53:00", category: category_3, isbn: "9780857501462", 
						blurb: "Winston Churchill understood and wielded the power of words throughout his six decades in the public eye.",
            page_count: 688, price: 85)
            

Book.create(title: 'The Wealth of Nations', 
						authors: [author_37], publisher: publisher_7, 
						published_at: "1994-1-25 15:53:00", category: category_4, isbn: "9780679424734", 
						blurb: "Adam Smith's masterpiece, first published in 1776",
            page_count: 1130, price: 196.90)


Book.create(title: 'Who Moved My Cheese?', 
						authors: [author_38], publisher: publisher_7, 
						published_at: "1999-3-4 15:53:00", category: category_4, isbn: "9780091816971", 
						blurb: "An amusing and enlightening story of four characters",
            page_count: 94, price: 60)
            
            
Book.create(title: 'Bad Blood Secrets and Lies in a Silicon Valley', 
						authors: [author_39], publisher: publisher_7, 
						published_at: "2018-5-21 15:53:00", category: category_4, isbn: "9781524711481", 
						blurb: "A riveting story of the biggest corporate fraud since Enron， a tale of ambition and hubris set amid the bold promises of Silicon Valley.",
						page_count: 352, price: 125)
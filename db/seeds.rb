User.create!(email: 'test@test.com', username: "test", password: "aaa")
Jab.create!(title: 'first post', content:"This is my content", subject: "a new post", user_id: 1)
Jab.create!(title: 'second post', content:"This is my content even more now!", subject: "another post", user_id: 1)
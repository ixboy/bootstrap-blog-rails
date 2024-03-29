After viewing a tutorial on YouTube, I embarked on the development of a blog using Ruby on Rails 6, following the MVC pattern and integrating Bootstrap 5 for the frontend. The platform allows registered users to create posts and comment on others' content, with distinct roles and privileges assigned to each user category. Administrators possess the authority to manage categories, while moderators can create and edit them but lack the capability to delete. Despite my intention to further enhance the blog with features like comment editing, post liking, and photo uploads, personal commitments will delay my return to this project until mid 2024. However, I remain dedicated to its progression and look forward to its continued evolution upon my resumption.

## Screenshot

![screenshot](./app/assets/images/main_screenshot.png)
![screenshot](./app/assets/images/second_screenshot.png)

## Built With

- [Ruby](https://www.ruby-lang.org/en/) 3.0.1
- [Rails](https://guides.rubyonrails.org/getting_started.html) 6.1.3
- [Gems](https://rubygems.org/)
  - [devise](https://github.com/heartcombo/devise)
  - [pundit](https://github.com/varvet/pundit)
  - [rolify](https://github.com/RolifyCommunity/rolify)
  - [groupdate](https://github.com/ankane/groupdate)
  - [faker](https://github.com/faker-ruby/faker)
  - [sqlite3](https://github.com/sparklemotion/sqlite3-ruby)

## Live Demo

[Click here to view it live on Heroku](https://bootstrap-rails-blog-b7556c55d018.herokuapp.com/)

## Initial settings to run the project

```bash
# clone the project
git clone https://github.com/ixboy/bootstrapblog.git

# enter the cloned directory
cd bootstrapblog

# install Ruby on Rails dependencies
bundle install

# install Node dependencies
yarn install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# populate data
rails db:seed

# run the project
rails s
```

### Prerequisites

- Ruby on Rails v6.x. To learn how to install Ruby on Rails, please follow this [link](https://guides.rubyonrails.org/getting_started.html)

### Usage

- start a server with `rails s`

- open `http://localhost:3000/` in your browser.

- Sign up with your email and password, an email confirmation will be sent to you and then you can start enjoying the app...

- After seeding there will be 10 users created and the user1 and user10 are admins, the rest are all normal users, you can find the user details bellow, all users have the same password for testing purposes.
- Admins:
  - user1@email.com | password: 123456
  - user10@email.com | password: 123456
- Normal users:
  - user2@email.com | password: 123456
  - user3@email.com | password: 123456


## Deployment

- The App is deployed on Heroku!

## Author

👤 **Iyunda Ismael Antonio**

- GitHub: [@ixboy](https://github.com/ixboy)
- Twitter: [@ismaelixboy](https://twitter.com/ismaelixboy)
- LinkedIn: [ismael-antonio](https://www.linkedin.com/in/ismaelantonio/)


## Acknowledgments

- Tutorial by: [Paulo Melo](https://github.com/peimelo)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ixboy/bootstrapblog/issues).

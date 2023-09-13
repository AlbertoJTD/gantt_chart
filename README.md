## Minimal requirements
- Ruby 3.1.2
- Ruby on Rails 7.0.7.2
- JDK 20
- PostgreSQL

## Frameworks and libraries
- [Ruby on Rails](https://rubyonrails.org)
- [Stimulus.js](https://stimulus.hotwired.dev)
- [Tailwindcss](https://tailwindui.com)
- [Postgresql](https://postgresapp.com)
- [DHTMLX Gantt](https://docs.dhtmlx.com/gantt/)
- [JDK 20](https://www.oracle.com/java/technologies/downloads/)
- [mpxj](https://rubygems.org/gems/mpxj)

## Getting Started

1. Install [JDK](https://www.oracle.com/java/technologies/downloads), this is required to use [mpxj](https://rubygems.org/gems/mpxj) gem

2. Clone the repository
```ruby
git clone https://github.com/AlbertoJTD/gantt_chart.git
cd gantt_chart
```

4. Install gems
```ruby
bundle install
```

4. Create database and run migrations
```ruby
rails db:create db:migrate
```

5. Run development server
```ruby
./bin/dev
```

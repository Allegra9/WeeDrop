# README

Medical marijuana same day drone delivery across London.

This is an end of Mod2 project (Flatiron School), built in 4 days using Ruby on Rails, pair programmed with Gabriel @GCdM, presented in Science Fair 13/7/2018

Demo video: https://www.youtube.com/watch?v=nlYGWVqFd1U&t=1s

To get this app up and running, run:

rake db:migrate db:seed

This will run the migrations and seed your database with the data from the seeds.rb file.

Then run:
rails s
to get the server running and go to:

localhost:3000  in your browser 

Have fun! Shop 'til WeeDrop!

To protect the database from bad data, this application has strict validations,
i.e., we are using:
 gem "uk_postcode", "~> 2.1.0"

to validate the UK postcodes.

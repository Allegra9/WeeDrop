# README

To get this app up and running, run:

rake db:migrate db:seed

This will run the migrations and seed your database with the data that is in the seeds.rb file.

Then run:

rails s
to get the server running and go to:

localhost:3000/wines
in your brower (let me guess you're using Crome).

Have fun! Shop 'till WeeDrop!

To protect the database from bad data, this application has strict validations,
i.e., we are using:
 gem "uk_postcode", "~> 2.1.0"

to validate the UK postcodes. 

# Members

App to help inviting members and to coordinate general meetings

## Invite members

to test locally:
Member.invite!(:email => "ole.morten.amundsen@gmail.com", :name => "Ole Morten")

NB: do not use this for production as invitation tokens will be store locally.

TODO: create invitation sending at BackOffice or for other admin page.

# Setup and installation

See README at https://github.com/rubykurs/bootstrap for more info on how this app was built and started out. This app is based off on that and it is more likely to be updated than 'yet another app'

## start
bundle install  #NB: jeg opplever noen rare ting med at executablen ikke blir registrert etter gem install bundler og bundle. Gjør da `cd ..` og `cd members`, det har av snodige grunner funkert oss meg.

rake db:migrate
rake test # probably a bad idea...

rake db:seed #Loads what's in db/seeds.rb
rails s #start server

Notice the admin at the top right? Hint: look at db/seeds.rb - this is awesome!



## Server
Deployed at heroku. Ask Knut Johannes Dahle or Ole Morten Heggebakken Amundsen for access.
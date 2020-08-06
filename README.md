# TohsakaWeb
A Ruby on Rails web application which is designed to work with [TohsakaBot](https://github.com/Luukuton/TohsakaBot). The name comes from one of the main heroines of Fate/stay night, Tohsaka Rin.

## Dependencies
* Webserver (NGINX recommended)
* Ruby >= 2.7 supported
* Node.js (tested 14.5.0) and Yarn (tested 1.22.4) for Rails
* libmysqlclient-dev
* Gems specified in Gemfile

## Usage
1. Setup [TohsakaBot](https://github.com/Luukuton/TohsakaBot).
2. Install everything by running 

   ```
   bundle install
   npm install
   yarn install --check-files
   ```
3. Enter the webhost (eg. rin.domain.com)and path to TohsakaBot (eg. /home/rin/TohsakaBot) to [config/user_config.yml](config/user_config.yml).
4. Enter credentials to Discord and SQL database to config/credentials.ymc.enc by typing this command: 
   
   ```
   EDITOR="nano" rails credentials:edit
   ```
5. Setup NGINX. Example config with SSL for TohsakaWeb [here](documentation/tohsakaweb_nginx.conf).
6. The app can be started by 
   
   ```
   bundle exec puma -b unix://tmp/sockets/server.sock
   ```

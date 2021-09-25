# TohsakaWeb
A Ruby on Rails web application which is designed to work with [TohsakaBot](https://github.com/Luukuton/TohsakaBot). The name comes from one of the main heroines of Fate/stay night, Tohsaka Rin.

## Usage
- Setup [TohsakaBot](https://github.com/Luukuton/TohsakaBot).
- Install everything by first running
   `bundle install` and then `npm install`.
- Copy [config/user_config.example.yml](config/user_config.example.yml) as `config/user_config.yml`. Now enter the webhost (eg. rin.domain.com), path to TohsakaBot (eg. /home/rin/TohsakaBot) and Discord ID of the owner to there.
- Enter Discord and SQL database credentials to config/credentials.ymc.enc with the following command: 
   
   ```
   EDITOR="nano" rails credentials:edit
   ```
   
- Setup NGINX. Example config with SSL for TohsakaWeb [here](documentation/tohsakaweb_nginx.conf).
- Precompile assets with `rails assets:precompile`
- The app can be started by 
   
   ```
   bundle exec puma -b unix://tmp/sockets/server.sock
   ```

## Dependencies
* Web server (NGINX recommended)
* Ruby >= 2.7 supported
* Node.js (tested 14.5.0+) and Yarn (tested 1.22.4+) for Rails
* libmysqlclient-dev

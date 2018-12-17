# README

videoplayer API

Ruby version: 2.5.3

Available routes:
* customer/add_stream 
* customer/current_streams
* video/current_views
* api/queries_count

Default Redis settings (it can be changed in application.rb)
* host: localhost
* port: 6379

Available cache stores
* memory_store
* redis_cache_store
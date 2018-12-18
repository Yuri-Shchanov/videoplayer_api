# README

videoplayer API

Ruby version: 2.5.3

Available routes:
* POST customer/add_stream 
* GET customer/current_streams
* GET video/current_views
* GET api/queries_count

Default Redis settings (it can be changed in config/#{environment}.rb)
* host: localhost
* port: 6379

Available cache stores
* memory_store
* redis_cache_store
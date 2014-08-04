# Description

This is a web API to solve a 2-player, 5-card poker problem
(http://cyber-dojo.org/setup/show/1E8447).
It takes advantage of poker\_hands gem (https://github.com/jallauca/poker\_hands)
It uses a Sinatra application to serve requests.

# Install
    bundle install --binstubs

# Launch the web server
Launch with default port 9292

    ./launch
Launch with specific port

    ./launch 9200

# Getting Started
Given a game:

        "Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH"

Perform a web request in this manner:

        http://localhost:4567/winner?Game=Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH

# Code Status
This particular web API is to be used for an interview question

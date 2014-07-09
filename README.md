##poker_web

This is a web API to solve a 2-player, 5-card poker problem
(http://cyber-dojo.org/setup/show/1E8447)
It takes advantage of poker_hands gem (https://github.com/jallauca/poker_hands)

## Getting Started
Given a game:

        "Black: 2H 3D 5S 9C KD White: 2C 3H 4S 8C AH"

Peform a web request in this manner:

        http://localhost:4567/winner?Game=Black:%202H%203D%205S%209C%20KD%20White:%202C%203H%204S%208C%20AH

Notice: Handname: is followed by colon, %20 function as spaces

## Code Status
This particular web API is to be used for an interview question

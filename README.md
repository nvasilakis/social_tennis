#Social Tennis App

This is an effort to merge all local ladders in to one national ladder. Each
player will have the ability to register in the Social Tennis and challenge any
player in a national level (of course given that she follows the ladder rules).
The locality (residence), statistic, performance, home tennis club and many
other essential information of each player will be known to anyone upon
registration. However, some more private information will be only known to
friends or selected friends.

It can be seen as an unofficial fork of the ATP/WTA sites with stats of each
player etc, but only for amateurs and semi-professional players will be
featured (pro players wouldn't have enough time to participate anyway).


## TODO
1. <del>add basic static pages (Home/About/Contact)</del>
2. Add basic users infastructure
3. Add advanced user profile
4. Add messaging infastructure. It can be used, virtually, for all inter-user
interactions.
5. Add user Wall that is part of the incoming/outgoing messages
6. ....



###Users Model
1. Every User can have many roles:
    1. a Tennis Player
    2. an Admin
    3. a Coach
    4. ...
    2. Upon registration (which requires only an email and a password) any user can modify her profile which can include
        1. Name (:all) (string)
        2. Email (:all) (email_string)
        3. Age (:all) (date)
        4. Local club (:all) (many to one)
        5. Additional info (:all)
            1. Started (meta-info: Years active) (:player/:admin/:coach) (date)
            2. Playing Style (:all)
                1. Plays (:all) (right | left)
                2. Forehand (:all) (one | double)
                3. Backhand (:all) (one | double | both)
                4. Details (:all) (text)
            3. Height (:all) (Float?)
            4. Weight (:all) (Float?)
            6. Singles
                1. Active? (:all) (date)
                2. (meta-info) Highest ranking (:all) (Integer)
                3. (meta-info) Current ranking (:all) (Integer)
                4. (meta-info) Career record (:all) (Integers)
            7. Doubles
                1. Active? (:all) (date)
                2. (meta-info) Highest ranking (:all) (Integer)
                3. (meta-info) Current ranking (:all) (Integer)
                4. (meta-info) Career record (:all) (Integers)


##Contributing
###General
* All contributions are welcome! Nevertheless, we have special need for
designers, rails experts, sysadmins and Android/iOS developers (HTML5 still
has a long way to go...)

###To Social Tennis App
* Fork this repository on github
* Write tests
* Write your code
* Send me a pull request


##License
Copyright © 2013 Filippos Vasilakis. Distributed under the
[MIT License](http://opensource.org/licenses/MIT "MIT License"). See
LICENSE for further details.



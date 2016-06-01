/* Terminal
 * Author: 
 * Creation date: 30/05/16
 */
MACHINE
    Terminal
    
    SEES          Boolean , BikeCTX , Type

    USES          Bike

    ABSTRACT_VARIABLES terminal_bikes

    INVARIANT         terminal_bikes <: bikes

    INITIALISATION    terminal_bikes := {}

    OPERATIONS

    rr <-- add_bike_to_terminal ( bb ) =
      PRE bb : BIKES_SET
      THEN
        IF bb /: terminal_bikes
        THEN terminal_bikes := terminal_bikes \/ { bb } || rr := true
        ELSE rr := false
        END
      END ;

    rr <-- remove_bike_to_terminal ( bb ) =
      PRE bb : BIKES_SET
      THEN
        IF bb : terminal_bikes
        THEN terminal_bikes := terminal_bikes - { bb } || rr := true
        ELSE rr := false
        END
      END ;

    qq <-- query_bike_to_terminal ( bb ) =
      PRE bb : BIKES_SET
      THEN
        IF bb : terminal_bikes
        THEN qq := true
        ELSE qq := false
        END
      END

END

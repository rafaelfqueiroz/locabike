
MACHINE
    Terminal

SEES
    Boolean , Context , Type

USES
    Bike

ABSTRACT_VARIABLES
    bikes_in_terminal

INVARIANT
    bikes_in_terminal <: bikes

INITIALISATION
    bikes_in_terminal := {}

OPERATIONS

    rr <-- add_bike_to_terminal ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb /: bikes_in_terminal
                THEN bikes_in_terminal := bikes_in_terminal \/ { bb } || rr := true
            ELSE rr := false
        END
    END ;

    rr <-- remove_bike_to_terminal ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : bikes_in_terminal
                THEN bikes_in_terminal := bikes_in_terminal - { bb } || rr := true
            ELSE rr := false
        END
    END ;

    qq <-- query_bike_to_terminal ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : bikes_in_terminal
                THEN qq := true
            ELSE qq := false
        END
    END

END

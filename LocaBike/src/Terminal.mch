
MACHINE
    Terminal

SEES
    Context, Bike, Central

VARIABLES
    bikes_in_terminal

INVARIANT
    bikes_in_terminal : BIKE >-> TERMINAL

INITIALISATION
    bikes_in_terminal := {}

OPERATIONS

    rr <-- add_bike_to_terminal ( tt, bb ) =
        PRE tt : TERMINAL & bb : BIKE
        THEN
            IF bb : bikes & bb /: dom ( bikes_in_terminal )
                THEN bikes_in_terminal ( bb ) := tt || rr := TRUE
            ELSE rr := FALSE
        END
    END;

    rr <-- remove_bike_from_terminal ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : dom ( bikes_in_terminal )
                THEN bikes_in_terminal := { bb } <<| bikes_in_terminal || rr := TRUE
            ELSE rr := FALSE
        END
    END

END

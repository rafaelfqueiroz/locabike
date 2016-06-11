
MACHINE
    Terminal

SEES
    Boolean, Context, Type

USES
    Bike, Central

VARIABLES
    bikes_in_terminal

INVARIANT
    bikes_in_terminal : bikes >-> terminals

INITIALISATION
    bikes_in_terminal := {}

OPERATIONS

    rr <-- add_bike_to_terminal ( tt, bb ) =
        PRE tt : TERMINAL & bb : BIKE
        THEN
            IF bb : bikes & bb /: dom ( bikes_in_terminal )
                THEN bikes_in_terminal ( bb ) := tt || rr := true
            ELSE rr := false
        END
    END;

    rr <-- remove_bike_from_terminal ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : dom ( bikes_in_terminal )
                THEN bikes_in_terminal := { bb } <<| bikes_in_terminal || rr := true
            ELSE rr := false
        END
    END

END

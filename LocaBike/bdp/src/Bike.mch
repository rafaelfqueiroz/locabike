MACHINE
    Bike

SEES
    Context , Type

ABSTRACT_VARIABLES
    bikes

INVARIANT
    bikes <: BIKE

INITIALISATION
    bikes := {}

OPERATIONS

    rr <-- add_bike ( bb ) =
        PRE bb : BIKE & bb : dom ( types )
        THEN
            IF bb /: bikes
                THEN bikes := bikes \/ { bb } || rr := TRUE
            ELSE rr := FALSE
        END
    END ;

    rr <-- remove_bike ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : bikes
                THEN bikes := bikes - { bb } || rr := TRUE
            ELSE rr := FALSE
        END
    END ;

    qq <-- query_bike ( bb ) =
        PRE bb : BIKE
            THEN
            IF bb : bikes
                THEN qq := TRUE
            ELSE qq := FALSE
        END
    END

END

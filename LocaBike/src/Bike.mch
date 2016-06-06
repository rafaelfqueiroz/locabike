MACHINE
    Bike

SEES
    Boolean, Context, Type

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
                THEN bikes := bikes \/ { bb } || rr := true
            ELSE rr := false
        END
    END;

    rr <-- remove_bike ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : bikes
                THEN bikes := bikes - { bb } || rr := true
            ELSE rr := false
        END
    END;

    qq <-- query_bike ( bb ) =
        PRE bb : BIKE
            THEN
            IF bb : bikes
                THEN qq := true
            ELSE qq := false
        END
    END

END

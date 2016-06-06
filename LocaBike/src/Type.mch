MACHINE
    Type

SEES
    Boolean, Context, Price

ABSTRACT_VARIABLES
    types

INVARIANT
    types : BIKE +-> TYPE

INITIALISATION
    types := {}

OPERATIONS

    set_type ( bb, tt ) =
        PRE bb : BIKE & tt : TYPE & tt : dom ( price )
        THEN types ( bb ) := tt
    END;

    qq <-- query_type ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : dom ( types )
                THEN qq := types ( bb )
            ELSE qq :: TYPE
        END
    END
END

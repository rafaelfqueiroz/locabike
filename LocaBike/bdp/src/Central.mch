MACHINE
    Central

SEES
    Context

ABSTRACT_VARIABLES
    terminals

INVARIANT
    terminals <: TERMINAL

INITIALISATION
    terminals := {}

OPERATIONS

    rr <-- add_terminal ( bb ) =
        PRE bb : TERMINAL
        THEN
            IF bb /: terminals
                THEN terminals := terminals \/ { bb } || rr := TRUE
            ELSE rr := FALSE
        END
    END ;

    rr <-- remove_terminal ( bb ) =
        PRE bb : TERMINAL
        THEN
            IF bb : terminals
                THEN terminals := terminals - { bb } || rr := TRUE
            ELSE rr := FALSE
        END
    END ;

    qq <-- query_terminal ( bb ) =
        PRE bb : TERMINAL
        THEN
            IF bb : terminals
                THEN qq := TRUE
            ELSE qq := FALSE
        END
    END

END

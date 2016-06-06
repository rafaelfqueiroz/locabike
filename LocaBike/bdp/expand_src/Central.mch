MACHINE
        Central

SEES
        Boolean , Context

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
                                THEN terminals := terminals \/ { bb } || rr := true
                        ELSE rr := false
                END
        END ;

        rr <-- remove_terminal ( bb ) =
                PRE bb : TERMINAL
                THEN
                        IF bb : terminals
                                THEN terminals := terminals - { bb } || rr := true
                        ELSE rr := false
                END
        END ;

        qq <-- query_terminal ( bb ) =
                PRE bb : TERMINAL
                THEN
                        IF bb : terminals
                                THEN qq := true
                        ELSE qq := false
                END
        END

END

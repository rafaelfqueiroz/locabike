MACHINE
    ClientManager

SEES
    Context

ABSTRACT_VARIABLES
    clients

INVARIANT
    clients <: CLIENT

INITIALISATION
    clients := {}

OPERATIONS

    rr <-- add_client ( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc /: clients
                THEN clients := clients \/ { cc } || rr := TRUE
            ELSE rr := FALSE
        END
    END;

    rr <-- remove_client ( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc : clients
                THEN clients := clients - { cc } || rr := TRUE
            ELSE rr := FALSE
        END
    END;

    qq <-- query_client( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc : clients
                THEN qq := TRUE
            ELSE qq := FALSE
        END
    END

END


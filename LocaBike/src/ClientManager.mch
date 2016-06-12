MACHINE
    ClientManager

SETS
    NAME

SEES
    Context

ABSTRACT_VARIABLES
    clients

INVARIANT
    clients <: CLIENT

INITIALISATION
    clients := {}

OPERATIONS

    add_client ( cc ) =
        PRE cc : CLIENT
        THEN clients := clients \/ { cc }
    END;

    remove_client ( cc ) =
        PRE cc : CLIENT
        THEN clients := clients - { cc }
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


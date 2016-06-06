MACHINE
    Time

ABSTRACT_VARIABLES
    time

INVARIANT
    time : NAT

INITIALISATION
    time := 0

OPERATIONS

    pass_time ( tt ) =
        PRE tt : NAT
        THEN time := time + tt
    END;
    
    pass_hour =  time := time + 1;

    qq <-- query_time =  qq := time

END

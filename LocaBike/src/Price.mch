MACHINE
    Price

SEES
    Boolean, Context

ABSTRACT_VARIABLES
    price, hour_price

INVARIANT
    price : TYPE +-> NAT1 & hour_price : TYPE +-> NAT1

INITIALISATION
    price, hour_price := {}, {}

OPERATIONS
    set_price ( cc, pp, dly ) =
        PRE cc : TYPE & pp : NAT1 & dly : NAT1
        THEN price ( cc ) := pp || hour_price ( cc ) := dly
    END;

    pp <-- query_price ( cc ) =
        PRE cc : TYPE
        THEN pp := price ( cc )
    END

END

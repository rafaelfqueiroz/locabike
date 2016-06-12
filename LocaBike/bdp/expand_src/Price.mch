MACHINE
    Price

SEES
    Context

ABSTRACT_VARIABLES
    price , hour_price

INVARIANT
    price : TYPE +-> NAT1 & hour_price : TYPE +-> NAT1

INITIALISATION
    price , hour_price := {} , {}

OPERATIONS

    set_price ( tt , dp , hp ) =
        PRE tt : TYPE & dp : NAT1 & hp : NAT1
        THEN price ( tt ) := dp || hour_price ( tt ) := hp
    END ;

    dp <-- query_price ( tt ) =
        PRE tt : TYPE
        THEN dp := price ( tt )
    END

END

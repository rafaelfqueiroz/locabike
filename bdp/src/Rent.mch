MACHINE
    Rent

USES
    Bike

INCLUDES
    Boolean , Context , ClientManager , Time , Type

ABSTRACT_VARIABLES
    rents , return_date

INVARIANT
    rents : clients >+> bikes & return_date : ran ( rents ) --> 1 .. 100

INITIALISATION
    rents , return_date := {} , {}

OPERATIONS

    rr <-- rent ( cc , bb ) =
        PRE bb : BIKE & cc : CLIENT
        THEN
            IF bb : bikes & cc : clients & cc /: dom ( rents ) & bb /: ran ( rents )
                THEN rents ( cc ) := bb || rr := true
            ELSE rr := false
            END
    END ;

    rr <-- return ( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc : dom ( rents )
                THEN
                    IF return_date ( rents ( cc ) ) < time
                    THEN
                        rents := { cc } <<| rents ||
                        return_date := { rents ( cc ) } <<| return_date ||
                        rr := true
                    ELSE
                        rents := { cc } <<| rents ||
                        return_date := { rents ( cc ) } <<| return_date ||
                        rr := true
                    END
            ELSE
                rr := false
            END
    END ;

    qq <-- query_rents ( cc , bb ) =
        PRE cc : CLIENT & bb : BIKE
        THEN
            IF cc : dom ( rents ) & bb : ran ( rents ) & rents ( cc ) = bb
            THEN qq := true
            ELSE qq := false
        END
    END ;

    qq <-- query_rented ( bb ) =
        PRE bb : BIKE
        THEN
            IF bb : ran ( rents )
            THEN qq := true
            ELSE qq := false
        END
    END ;

    qq <-- query_renter ( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc : dom ( rents )
            THEN qq := true
            ELSE qq := false
        END
    END

END

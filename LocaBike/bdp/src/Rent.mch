MACHINE
    Rent

INCLUDES
    ClientManager , Bike

PROMOTES
    add_client , query_client , add_bike , query_bike

SEES
    Boolean , Context , Type , Time , Price

ABSTRACT_VARIABLES
    rents , return_date

INVARIANT
    rents : clients >+> bikes & return_date : ran ( rents ) --> 1 .. 100

INITIALISATION
    rents , return_date := {} , {}

OPERATIONS

    rr <-- remove_non_renter_client ( cc ) =
        PRE cc : CLIENT
        THEN
            IF cc : clients & cc /: dom ( rents )
                THEN remove_client ( cc ) || rr := true
            ELSE rr := false
        END
    END ;

    rr <-- remove_non_rented_bike ( vv ) =
        PRE vv : BIKE
        THEN
            IF vv : bikes & vv /: ran ( rents )
                THEN rr <-- remove_bike ( vv )
            ELSE rr := false
        END
    END ;


    rr <-- rent ( cc , vv , rd ) =
        PRE vv : BIKE & cc : CLIENT & rd : NAT1 & rd > time & rd <= 100
        THEN
            IF vv : bikes & cc : clients & cc /: dom ( rents ) & vv /: ran ( rents )
                THEN rents ( cc ) := vv || return_date ( vv ) := rd || rr := true
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

    qq <-- query_rents ( cc , vv ) =
        PRE cc : CLIENT & vv : BIKE
        THEN
            IF cc : dom ( rents ) & vv : ran ( rents ) & rents ( cc ) = vv
            THEN qq := true
            ELSE qq := false
        END
    END ;

    qq <-- query_rented ( vv ) =
        PRE vv : BIKE
        THEN
            IF vv : ran ( rents )
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

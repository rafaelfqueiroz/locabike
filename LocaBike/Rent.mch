/* Rent
 * Author: Rafael Queiroz
 * Creation date: 30/05/16
 */
MACHINE
    Rent
    
    INCLUDES          Penalty

    USES              ClientManager , Bike

    SEES              Boolean , Type , Time , Price , Damage , ClientCTX , BikeCTX

    ABSTRACT_VARIABLES rents , return_date

    INVARIANT         rents : clients >+> bikes & return_date : ran ( rents ) --> NAT1

    INITIALISATION    rents , return_date := {} , {}

    OPERATIONS

    rr <-- rent ( cc , bb , rd ) =
      PRE bb : BIKES_SET & cc : CLIENTS_SET & rd : NAT1 & rd > time
      THEN
        IF bb : bikes & cc : clients & cc /: dom ( rents ) & bb /: ran ( rents ) & penalty ( cc ) = 0
        THEN rents ( cc ) := bb || return_date ( bb ) := rd || rr := true
        ELSE rr := false
        END
      END ;

    rr , rp <-- return ( cc ) =
      PRE cc : CLIENTS_ST
      THEN
        IF cc : dom ( rents )
        THEN
            IF return_date ( rents ( cc ) ) < time
            THEN
                rents := { cc } <<| rents ||
                return_date := {} <<| return_date ||
                rp <-- apply_penalty ( cc , damage_price ( damages ( rents ( cc ) ) ) , ( time - return_date ( rents ( cc ) ) * delay_price (                     category ( rents ( cc ) ) ) ) ) ||
                rr := true
            ELSE
                rents := { cc } <<| rents ||
                return_date := { rents ( cc ) } <<| return_date ||
                rp <-- apply_penalty ( cc , damage_price ( damages ( rents ( cc ) ) ) , 0 ) ||
                rr := true
            END
        ELSE rr := false ||
            rp := false
        END
      END ;

    qq <-- query_rents ( cc , bb ) =
      PRE cc : CLIENTS_ST & vv : BIKES_ST
      THEN
        IF cc : dom ( rents ) & vv : ran ( rents ) & rents ( cc ) = vv
        THEN qq := true
        ELSE qq := false
        END
      END ;

    qq <-- query_rented ( bb ) =
      PRE bb : BIKES_ST
      THEN
        IF bb : ran ( rents )
        THEN qq := true
        ELSE qq := false
        END
      END ;

    qq <-- query_renter ( cc ) =
      PRE cc : CLIENTS_ST
      THEN
        IF cc : dom ( rents )
        THEN qq := true
        ELSE qq := false
        END
      END

END

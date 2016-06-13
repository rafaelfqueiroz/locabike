MACHINE
    Rent

INCLUDES
    ClientManager, Bike, Time

PROMOTES
    add_client, query_client, add_bike, query_bike

SEES
    Context, Type, Price

ABSTRACT_VARIABLES
    rents, return_date

INVARIANT
    rents : clients >+> bikes & return_date : ran ( rents ) --> 1 .. 100

INITIALISATION
    rents, return_date := {}, {}

OPERATIONS

    rr <-- rent (cc, bb) =
        PRE bb : BIKE & cc : CLIENT
        THEN
            IF bb:bikes & cc:clients & cc /: dom(rents) & bb /: ran(rents)
                THEN rents(cc) := bb || rr := TRUE
            ELSE rr := FALSE
            END
    END;

    rr <-- return ( cc ) =
        PRE cc:CLIENT
        THEN
            IF cc : dom(rents)
                THEN
                    IF return_date(rents(cc)) < time
                    THEN
                        rents := {cc} <<| rents ||
                        return_date := {rents(cc)} <<| return_date ||
                        rr:=TRUE
                    ELSE
                        rents := {cc} <<| rents ||
                        return_date:= {rents(cc)} <<| return_date||
                        rr:=TRUE
                    END
            ELSE
                rr:=FALSE
            END
    END;

    qq <-- query_rents(cc, bb)=
        PRE cc:CLIENT & bb:BIKE
        THEN
            IF cc : dom(rents) & bb : ran(rents) & rents(cc) = bb
            THEN qq := TRUE
            ELSE qq := FALSE
        END
    END;

    qq <-- query_rented(bb)=
        PRE bb:BIKE
        THEN
            IF bb : ran(rents)
            THEN qq := TRUE
            ELSE qq := FALSE
        END
    END;

    qq <-- query_renter(cc)=
        PRE cc:CLIENT
        THEN
            IF cc : dom(rents)
            THEN qq := TRUE
            ELSE qq := FALSE
        END
    END

END

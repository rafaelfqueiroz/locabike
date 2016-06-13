
MACHINE
    System

SEES
    Context, Price

INCLUDES
     Rent, Central, Terminal, Time

PROMOTES
    add_bike, add_client, add_terminal, add_bike_to_terminal, remove_bike_from_terminal, pass_time, pass_hour, query_time

OPERATIONS

    rr, rt <-- rent_from_any_terminal ( cc, bb ) =
        PRE cc : CLIENT & bb : BIKE
        THEN
            IF bb : bikes & bb : dom ( bikes_in_terminal )
            THEN
                rr <-- rent ( cc, bb ) ||
                rt <-- remove_bike_from_terminal ( bb )
            ELSE
                rr := FALSE ||
                rt := FALSE
            END
        END;

    rr, rt <-- return_to_terminal ( cc, bb, tt ) =
        PRE cc : CLIENT & bb : BIKE & tt : TERMINAL
        THEN
            IF cc : dom ( rents )
            THEN
                rr <-- return ( cc ) ||
                rt <-- add_bike_to_terminal ( tt, bb )
            ELSE
                rr := FALSE ||
                rt := FALSE
            END
        END

END

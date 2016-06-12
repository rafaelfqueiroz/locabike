
MACHINE
    System

INCLUDES
    Type, Bike, ClientManager, Rent, Central, Terminal

PROMOTES
    set_type, add_bike, add_client, add_terminal, add_bike_to_terminal, remove_bike_from_terminal

OPERATIONS

    rr <-- rent_from_any_terminal ( cc, bb ) =
        PRE cc : CLIENT & bb : BIKE
        THEN
            IF bb : bikes & bb : dom ( bikes_in_terminal )
                THEN rr <-- rent ( cc, bb )
            ELSE rr := FALSE
            END
    END

END

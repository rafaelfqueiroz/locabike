
MACHINE
    System

INCLUDES
    Rent , Central , Terminal , Bike

PROMOTES
    add_terminal , add_bike_to_terminal , remove_bike_from_terminal

OPERATIONS

    rr <-- rent_from_any_terminal ( cc , bb ) =
        PRE cc : CLIENT & bb : BIKE
        THEN
            IF bb : dom ( bikes_in_terminal )
                THEN rr <-- rent ( cc , bb )
            ELSE rr := false
            END
    END

END

/* Type
 * Author: 
 * Creation date: 25/05/16
 */
MACHINE
    Type
    SEES Boolean, BikeCTX, TypeCTX, Price
    ABSTRACT_VARIABLES types
    INVARIANT types : Bikes_SET +-> Types_SET
    INITIALISATION types := {}
    
OPERATIONS
    
        set_category(bb, tt) =
        PRE bb : Bikes_SET & tt : Types_SET & tt : dom(price)
        THEN types(bb) := tt
        END;
        
        qq <-- query_type(bb) =
        PRE bb : Bikes_SET
        THEN
            IF bb : dom(types)
            THEN qq := types(bb)
            ELSE qq :: Types_SET
            END
        END;
        
END

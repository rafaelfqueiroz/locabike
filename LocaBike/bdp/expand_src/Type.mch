/* Type
 * Author: Rafael Queiroz
 * Creation date: 25/05/16
 */
MACHINE
    Type

    SEES Boolean , BikeCTX , TypeCTX , Price
    ABSTRACT_VARIABLES types
    INVARIANT types : BIKES_SET +-> TYPES_SET
    INITIALISATION types := {}

    OPERATIONS

        set_category ( bb , tt ) =
        PRE bb : BIKES_SET & tt : TYPES_SET & tt : dom ( price )
        THEN types ( bb ) := tt
        END ;

        qq <-- query_type ( bb ) =
        PRE bb : BIKES_SET
        THEN
            IF bb : dom ( types )
            THEN qq := types ( bb )
            ELSE qq :: TYPES_SET
            END
        END
    END

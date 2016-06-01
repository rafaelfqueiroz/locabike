/* ClientManager
 * Author: Rafael Queiroz
 * Creation date: 25/05/16
 */
MACHINE
    ClientManager

    SETS NAME

    SEES ClientCTX , Boolean

    ABSTRACT_VARIABLES clients

    INVARIANT clients <: CLIENTS_SET

    INITIALISATION clients := {}

    OPERATIONS

        add_client ( cc ) =
            PRE cc : CLIENTS_SET
            THEN
                clients := clients \/ { cc }
            END ;

         remove_client ( cc ) =
             PRE cc : CLIENTS_SET
             THEN
                clients := clients - { cc }
             END ;

         qq <-- query_client ( cc ) =
             PRE cc : CLIENTS_SET
             THEN
                 IF cc : clients
                 THEN qq := true
                 ELSE qq := false
                 END
             END

END

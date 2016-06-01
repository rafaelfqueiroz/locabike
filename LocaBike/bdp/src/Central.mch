/* Terminal
 * Author: 
 * Creation date: 30/05/16
 */
MACHINE
    Central

    SEES                          Boolean , TerminalCTX
    ABSTRACT_VARIABLES         terminals
        INVARIANT                 terminals <: TERMINALS_SET

        INITIALISATION            terminals := {}

        OPERATIONS

        rr <-- add_terminal ( bb ) =
          PRE bb : TERMINALS_SET
          THEN
            IF bb /: terminals
            THEN terminals := terminals \/ { bb } || rr := true
            ELSE rr := false
            END
          END ;

        rr <-- remove_terminal ( bb ) =
          PRE bb : TERMINALS_SET
          THEN
            IF bb : terminals
            THEN terminals := terminals - { bb } || rr := true
            ELSE rr := false
            END
          END ;

        qq <-- query_terminal ( bb ) =
          PRE bb : TERMINALS_SET
          THEN
            IF bb : terminals
            THEN qq := true
            ELSE qq := false
            END
          END

END

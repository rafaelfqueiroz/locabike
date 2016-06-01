/* Penalty
 * Author: Rafael Queiroz
 * Creation date: 30/05/16
 */
MACHINE
    Penalty

    SEES              Boolean , ClientCTX

    ABSTRACT_VARIABLES penalty

    INVARIANT         penalty : CLIENTS_SET +-> NAT

    INITIALISATION    penalty := CLIENTS_SET * { 0 }

    OPERATIONS

    rr <-- apply_penalty ( cc , dmgp , dlyp ) =
      PRE cc : CLIENTS_SET & dmgp : NAT & dlyp : NAT
      THEN
        IF ( dmgp + dlyp ) > 0
        THEN penalty ( cc ) := ( dmgp + dlyp ) || rr := true
        ELSE rr := false
        END
      END ;

    qq <-- query_penalty ( cc ) =
      PRE cc : CLIENTS_SET
      THEN qq := penalty ( cc )
      END

END

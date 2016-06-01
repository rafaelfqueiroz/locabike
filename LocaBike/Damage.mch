/* Damage
 * Author: Rafael Queiroz
 * Creation date: 30/05/16
 */
MACHINE
    Damage
    SEES              DamageCTX , BikeCTX , Boolean
    ABSTRACT_VARIABLES damages

    INVARIANT         damages : BIKES_SET --> DAMAGES_SET

    INITIALISATION    damages := BIKES_SET * { no_damage }

    OPERATIONS

    apply_damage ( dd , vv ) =
      PRE dd : DAMAGES_SET & dd /= no_damage & vv : BIKES_SET
      THEN damages ( vv ) := dd
      END ;

    rr <-- fix_damage ( vv ) =
      PRE vv : BIKES_SET
      THEN
        IF damages ( vv ) /= no_damage
        THEN damages ( vv ) := no_damage || rr := true
        ELSE rr := false
        END
     END

END

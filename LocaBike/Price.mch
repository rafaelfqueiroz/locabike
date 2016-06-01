/* Price
 * Author: Rafael Queiroz
 * Creation date: 25/05/16
 */
MACHINE           
    Price

SEES              TypeCTX , DamageCTX , Damage , Boolean , BikeCTX

ABSTRACT_VARIABLES damage_price , price , delay_price

INVARIANT         damage_price : DAMAGES_SET +-> NAT & price : TYPES_SET +-> NAT1 & delay_price : TYPES_SET +-> NAT1

INITIALISATION    damage_price , price , delay_price := { no_damage |-> 0 } , {} , {}

OPERATIONS

set_damage_price ( dd , pp ) =
  PRE dd : DAMAGES_SET & pp : NAT
  THEN damage_price ( dd ) := pp
  END ;


qq <-- query_damage_penalty ( vv ) =
  PRE vv : BIKES_SET
  THEN qq := damage_price ( damages ( vv ) )
  END ;

qq , rr <-- query_damage_price ( dd ) =
  PRE dd : DAMAGES_SET
  THEN
    IF dd : dom ( damage_price )
    THEN qq := damage_price ( dd ) || rr := true
    ELSE qq :: NAT || rr := false
    END
  END ;

set_price ( cc , pp , dly ) =
  PRE cc : TYPES_SET & pp : NAT1 & dly : NAT1
  THEN price ( cc ) := pp || delay_price ( cc ) := dly
  END ;

pp <-- query_price ( cc ) =
  PRE cc : TYPES_SET THEN pp := price ( cc ) END

END

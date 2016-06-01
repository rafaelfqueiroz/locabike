/* Bike
 * Author: Rafael Queiroz
 * Creation date: 30/05/16
 */
MACHINE
    Bike
    
    SEES              Boolean , BikeCTX , Type

ABSTRACT_VARIABLES bikes

INVARIANT         bikes <: BIKES_SET

INITIALISATION    bikes := {}

OPERATIONS

<<<<<<< HEAD
rr <-- add_bike ( bb ) =
=======
rr <-- add_vehicle ( bb ) =
>>>>>>> 97379ec89db9ffe3d54631258138a24c50643e2d
  PRE bb : BIKES_SET & bb : dom ( types )
  THEN
    IF bb /: bikes
    THEN bikes := bikes \/ { bb } || rr := true
    ELSE rr := false
    END
  END ;

<<<<<<< HEAD
rr <-- remove_bike ( bb ) =
=======
rr <-- remove_vehicle ( bb ) =
>>>>>>> 97379ec89db9ffe3d54631258138a24c50643e2d
  PRE bb : BIKES_SET
  THEN
    IF bb : bikes
    THEN bikes := bikes - { bb } || rr := true
<<<<<<< HEAD
    ELSE rr := false
    END
  END ;

qq <-- query_bike ( bb ) =
=======
    ELSE bb := false
    END
  END ;

qq <-- query_vehicle ( bb ) =
>>>>>>> 97379ec89db9ffe3d54631258138a24c50643e2d
  PRE bb : BIKES_SET
  THEN
    IF bb : bikes
    THEN qq := true
    ELSE qq := false
    END
  END

END

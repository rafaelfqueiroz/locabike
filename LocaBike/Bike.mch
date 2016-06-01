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

rr <-- add_bike ( bb ) =
  PRE bb : BIKES_SET & bb : dom ( types )
  THEN
    IF bb /: bikes
    THEN bikes := bikes \/ { bb } || rr := true
    ELSE rr := false
    END
  END ;

rr <-- remove_bike ( bb ) =
  PRE bb : BIKES_SET
  THEN
    IF bb : bikes
    THEN bikes := bikes - { bb } || rr := true
    ELSE rr := false
    END
  END ;

qq <-- query_bike ( bb ) =
  PRE bb : BIKES_SET
  THEN
    IF bb : bikes
    THEN qq := true
    ELSE qq := false
    END
  END

END

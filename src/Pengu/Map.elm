module Pengu.Map exposing (World, Room, Layer, Zone, ZoneKind(..), Action(..))

{-| This module contains types for creating a game world.
@docs World, Room, Layer, Zone, ZoneKind, Action
-}

import Dict exposing (Dict)
import Geometry exposing (Point, Polygon)


{-| Game world is a collection of rooms.
-}
type alias World =
    Dict String Room


{-| For performance reasons, the world is divided into rooms, between which players can roam freely.
-}
type alias Room =
    { layers : List Layer
    , spawnPoints : Point
    , zones : List Zone
    , music : Maybe String
    }


{-| Rooms consist of multiple graphical layers that provide illusion of depth.
-}
type alias Layer =
    { id : String
    , file : String
    , width : Float
    , height : Float
    , x : Float
    , y : Float
    , z : Float
    }


{-| To add interactivity, rooms can contain areas that do not allow player to enter (obstacles), bring her to another room (portals) or set off another action (triggers).
-}
type alias Zone =
    { polygon : Polygon
    , kind : ZoneKind
    }


{-| Kind of the room zone.
-}
type ZoneKind
    = Obstacle String
    | Portal String
    | Trigger Action


{-| Action to be triggered by entering a trigger zone.
-}
type Action
    = Play String

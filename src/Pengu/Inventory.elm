module Pengu.Inventory exposing (Item, ItemKind, Inventory)

{-| This module contains types representing items a game character can wear, different kinds of those items and a inventory.

# Definition
@docs Item, ItemKind, Inventory
-}

import Set exposing (Set)


{-| Representation of an item for game character to wear.
-}
type alias Item =
    { id : Int
    , title : String
    , available : Bool
    , kind : ItemKind
    , tags : List String
    , file : String
    , offset :
        { left : Float
        , right : Float
        }
    }


{-| Kind of an item, denoting which body part is the item to be worn on.
-}
type ItemKind
    = Head
    | Face
    | Body
    | Hand
    | Foot


{-| Inventory represents a set of items the player is wearing.
-}
type alias Inventory =
    Set Item

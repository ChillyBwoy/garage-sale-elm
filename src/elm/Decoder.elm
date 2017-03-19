module Decoder exposing (..)

import Json.Decode as Decode exposing (Decoder, field, string, float, bool, decodeString)
import Models exposing (..)


games : Decoder (List Game)
games =
    Decode.list game


game : Decoder Game
game =
    Decode.map5 Game
        (field "id" string)
        (field "sold" bool)
        (field "name" string)
        (field "comment" string)
        (field "price" float)

module Messages exposing (..)

import Http
import Models exposing (Game)


type Msg
    = Idle
    | FetchGames (Result Http.Error (List Game))
    | ToggleGameSale Game Bool

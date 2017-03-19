module Actions exposing (..)

import Http
import Messages exposing (..)
import Decoder exposing (games)


fetchGames : Cmd Msg
fetchGames =
    Http.get "/api/games.json" games
        |> Http.send FetchGames

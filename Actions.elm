module Actions exposing (..)

import Http
import Messages exposing (..)
import Decoder exposing (games)


fetchGames : Cmd Msg
fetchGames =
    Http.get "http://localhost:8000/data.json" games
        |> Http.send FetchGames

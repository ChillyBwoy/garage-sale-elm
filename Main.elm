port module Main exposing (..)

import Html
import Messages exposing (Msg(..))
import Models exposing (Model, initModel)
import Update exposing (update)
import View exposing (view)
import Actions exposing (fetchGames)


init : ( Model, Cmd Msg )
init =
    let
        model =
            initModel
    in
        ( model, fetchGames )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

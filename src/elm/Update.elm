module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)


toggleGameSold : Game -> Bool -> Game
toggleGameSold game checked =
    let
        sold =
            game.sold
    in
        { game | sold = checked }


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case Debug.log "MSG" message of
        Idle ->
            ( model, Cmd.none )

        FetchGames (Ok data) ->
            ( { model | games = data }, Cmd.none )

        FetchGames (Err error) ->
            ( model, Cmd.none )

        ToggleGameSale game checked ->
            let
                games =
                    model.games

                nextGames =
                    List.map
                        (\g ->
                            if game.id == g.id then
                                toggleGameSold game checked
                            else
                                g
                        )
                        games
            in
                ( { model | games = nextGames }, Cmd.none )

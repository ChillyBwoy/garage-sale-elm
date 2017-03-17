module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type_, checked, colspan, style)
import Html.Events exposing (onCheck)
import Models exposing (Model, Game)
import Messages exposing (Msg(..))


gamesTableRowView : Game -> Html Msg
gamesTableRowView game =
    tr
        [ style
            [ ( "text-decoration"
              , if game.sold then
                    "line-through"
                else
                    ""
              )
            ]
        ]
        [ td []
            [ input
                [ type_ "checkbox"
                , checked game.sold
                , onCheck (ToggleGameSale game)
                ]
                []
            ]
        , td [] [ text (toString game.price) ]
        , td [] [ text (toString game.name) ]
        , td [] [ text (toString game.comment) ]
        , td [] [ text (toString game.price) ]
        ]


gamesTableView : List Game -> Html Msg
gamesTableView games =
    let
        soldGames =
            List.filter (\g -> g.sold) games

        soldTotal =
            List.foldl (\g a -> a + g.price) 0 soldGames
    in
        table []
            [ thead []
                [ tr []
                    [ th [] [ text "Sold" ]
                    , th [] [ text "Serial" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Comment" ]
                    , th [] [ text "Price" ]
                    ]
                ]
            , tfoot [ colspan 5 ] [ text (toString soldTotal) ]
            , tbody []
                (List.map (\g -> gamesTableRowView g) games)
            ]


view : Model -> Html Msg
view model =
    div []
        [ gamesTableView model.games ]

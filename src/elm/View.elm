module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type_, checked, colspan, style, class)
import Html.Events exposing (onCheck)
import Models exposing (Model, Game)
import Messages exposing (Msg(..))


gamesTableRowView : Int -> Game -> Html Msg
gamesTableRowView index game =
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
        [ td [] [ text (toString (index + 1)) ]
        , td []
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
        total =
            List.foldl (\g a -> a + g.price) 0 games

        soldGames =
            List.filter (\g -> g.sold) games

        totalSold =
            List.foldl (\g a -> a + g.price) 0 soldGames
    in
        table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "#" ]
                    , th [] [ text "Sold" ]
                    , th [] [ text "Serial" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Comment" ]
                    , th [] [ text "Price" ]
                    ]
                ]
            , tfoot [ colspan 6 ] [ text ((toString totalSold) ++ " / " ++ (toString total)) ]
            , tbody []
                (List.indexedMap gamesTableRowView games)
            ]


view : Model -> Html Msg
view model =
    div [ class "layout" ]
        [ div [ class "page-header" ]
            [ h1 [] [ text "Garage Sale" ]
            ]
        , gamesTableView model.games
        ]

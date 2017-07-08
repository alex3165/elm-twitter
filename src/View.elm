module View exposing (..)

import Model exposing (State)
import Html exposing (Html, text, div, h1)
import Message exposing (..)
import Card exposing (card)
import Html.Attributes exposing (style)
import Colors exposing (mint)

mainStyle : List ( String, String )
mainStyle =
    []


titleStyle : List ( String, String )
titleStyle =
    [ ( "text-align", "center" )
    , ( "color", mint)
    ]


view : State -> Html Msg
view model =
    div [ style mainStyle ]
        [ h1 [ style titleStyle ] [ text "Trainline tweet wall" ]
        , div [] <| List.map card (Maybe.withDefault [] model.tweets)
        ]

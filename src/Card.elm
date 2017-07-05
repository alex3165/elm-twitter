module Card exposing (..)

import Model exposing (Tweet)
import Html exposing (Html, div, text)
import Message exposing (Msg)


card : Tweet -> Html Msg
card tweet =
    div []
        [ div [] [ text "image here" ]
        , div []
            [ div [] [ text "User profile here"]
            , div [] [ text "Tweet should go here" ]
            ]
        ]

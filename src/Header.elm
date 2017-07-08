module Header exposing (..)

import Colors exposing (mint)
import Html exposing (Html, text, div, h1)
import Html.Attributes exposing (style)
import Message exposing (..)
import Colors exposing (borderGrey)


titleStyle : List ( String, String )
titleStyle =
    [ ( "text-align", "center" )
    , ( "color", mint )
    , ( "margin", "4px")
    ]


containerStyle : List ( String, String )
containerStyle =
    [ ( "padding", "10px" )
    , ( "background-color", "white" )
    , ( "border-bottom", "1px solid" ++ borderGrey )
    ]


header : Html Msg
header =
    div [ style containerStyle ]
        [ h1 [ style titleStyle ] [ text "Trainline twitter wall" ]
        ]

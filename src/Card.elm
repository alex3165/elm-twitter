module Card exposing (..)

import Model exposing (Tweet)
import Html exposing (Html, div, text)
import Message exposing (Msg)
import Html.Attributes exposing (style)
import Colors exposing (borderGrey)


containerStyle : List ( String, String )
containerStyle =
    [ ( "background-color", "white" )
    , ( "border", "1px solid" ++ borderGrey )
    , ( "border-radius", "5px" )
    , ( "width", "600px" )
    , ( "margin", "20px auto" )
    ]


tweetCardStyle : List ( String, String )
tweetCardStyle =
    [ ( "display", "flex" )
    , ( "padding", "10px 20px")
    ]


userStyle : List ( String, String )
userStyle =
    [ ( "flex", "4" )
    ]


tweetStyle : List ( String, String )
tweetStyle =
    [ ( "flex", "8" )
    ]


card : Tweet -> Html Msg
card tweet =
    div [ style containerStyle ]
        [ div []
            [ case tweet.photos of
                Nothing ->
                    text ""

                Just val ->
                    text <| Maybe.withDefault "" (List.head val)
            ]
        , div [ style tweetCardStyle ]
            [ div [ style userStyle ]
                [ div [] [ text "user image here" ]
                , div [] [ text tweet.user.name ]
                , div [] [ text tweet.user.screen_name ]
                ]
            , div [ style tweetStyle ]
                [ div [] [ text tweet.description ]
                ]
            ]
        , div []
            [ case tweet.retweet of
                Nothing ->
                    text ""

                Just val ->
                    text <| "Retweeted by: " ++ val.screen_name
            ]
        ]

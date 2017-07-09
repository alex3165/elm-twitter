module Card exposing (..)

import Model exposing (Tweet)
import Html exposing (Html, div, text, img, span)
import Message exposing (Msg)
import Html.Attributes exposing (style, src)
import Colors exposing (borderGrey, grey, sky, mint)


containerStyle : List ( String, String )
containerStyle =
    [ ( "width", "600px" )
    , ( "margin", "20px auto" )
    ]


bodyStyle : List ( String, String )
bodyStyle =
    [ ( "background-color", "white" )
    , ( "border", "1px solid" ++ borderGrey )
    , ( "border-radius", "5px" )
    ]


mainPictureStyle : Maybe (List String) -> List ( String, String )
mainPictureStyle photos =
    case photos of
        Nothing ->
            []

        Just val ->
            [ ( "background-image", "url(" ++ Maybe.withDefault "" (List.head val) ++ ")" )
            , ( "background-size", "cover" )
            , ( "background-position", "center" )
            , ( "width", "100%" )
            , ( "height", "300px" )
            ]


tweetCardStyle : List ( String, String )
tweetCardStyle =
    [ ( "display", "flex" )
    , ( "padding", "10px 20px" )
    ]


userStyle : List ( String, String )
userStyle =
    [ ( "flex", "3" )
    ]


tweetStyle : List ( String, String )
tweetStyle =
    [ ( "flex", "9" )
    , ( "display", "flex" )
    , ( "align-items", "center" )
    ]


userNameStyle : List ( String, String )
userNameStyle =
    [ ( "color", grey )
    ]


avatarStyle : List ( String, String )
avatarStyle =
    [ ( "margin", "0px" )
    , ( "border-radius", "50%" )
    ]


linkStyle : List ( String, String )
linkStyle =
    [ ( "color", sky )
    ]


retweetStyle : List ( String, String )
retweetStyle =
    [ ( "color", mint )
    ]


avatar : String -> Html Msg
avatar userImage =
    div []
        [ img [ src userImage, style avatarStyle ] []
        ]


description : List String -> Html Msg
description dList =
    div [] <|
        List.map
            (\d ->
                if (String.contains "http" d) then
                    (span [ style linkStyle ] [ text d ])
                else
                    (span [] [ text d ])
            )
            dList


card : Tweet -> Html Msg
card tweet =
    div [ style containerStyle ]
        [ div [ style bodyStyle ]
            [ div [ style <| mainPictureStyle tweet.photos ] []
            , div [ style tweetCardStyle ]
                [ div [ style userStyle ]
                    [ div [] [ avatar tweet.user.profile_image_url_https ]
                    , div [ style userNameStyle ] [ text <| "@" ++ tweet.user.screen_name ]
                    ]
                , div [ style tweetStyle ]
                    [ div [] [ description tweet.description ]
                    ]
                ]
            ]
        , div []
            [ div [ style retweetStyle ]
                [ case tweet.retweet of
                    Nothing ->
                        text ""

                    Just val ->
                        text <| "Retweeted by: " ++ "@" ++ val.screen_name
                ]
            ]
        ]

module Card exposing (..)

import Model exposing (Tweet)
import Html exposing (Html, div, text, img)
import Message exposing (Msg)
import Html.Attributes exposing (style, src)
import Colors exposing (borderGrey)


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


avatarStyle : List ( String, String )
avatarStyle =
    [ ( "margin", "0px" )
    ]


avatar : String -> Html Msg
avatar userImage =
    div []
        [ img [ src userImage, style avatarStyle ] []
        ]


card : Tweet -> Html Msg
card tweet =
    div [ style containerStyle ]
        [ div [ style bodyStyle ]
            [ div [ style <| mainPictureStyle tweet.photos ] []
            , div [ style tweetCardStyle ]
                [ div [ style userStyle ]
                    [ div [] [ avatar tweet.user.profile_image_url_https ]
                    , div [] [ text <| "@" ++ tweet.user.screen_name ]
                    ]
                , div [ style tweetStyle ]
                    [ div [] [ text tweet.description ]
                    ]
                ]
            ]
        , div []
            [ div []
                [ case tweet.retweet of
                    Nothing ->
                        text ""

                    Just val ->
                        text <| "Retweeted by: " ++ val.screen_name
                ]
            ]
        ]

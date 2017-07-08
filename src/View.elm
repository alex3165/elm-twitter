module View exposing (..)

import Model exposing (State)
import Html exposing (Html, text, div, h1)
import Message exposing (..)
import Card exposing (card)
import Html.Attributes exposing (style)
import Header exposing (header)


mainStyle : List ( String, String )
mainStyle =
    []


view : State -> Html Msg
view model =
    div [ style mainStyle ]
        [ header
        , div [] <| List.map card (Maybe.withDefault [] model.tweets)
        ]

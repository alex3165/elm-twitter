module App exposing (..)

import Html exposing (Html)
import Model exposing (..)
import Message exposing (Msg, Msg(StreamTweets))
import View exposing (..)
import Subscriptions exposing (..)
import Update exposing (update)


init : ( State, Cmd Msg )
init =
    ( { tweets = Maybe.Nothing }, Cmd.none )



---- PROGRAM ----


main : Program Never State Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }

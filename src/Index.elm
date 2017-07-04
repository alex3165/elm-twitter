module App exposing (..)

import Html exposing (Html)
import Model exposing (..)
import Message exposing (..)
import View exposing (..)

init : ( State, Cmd Msg )
init =
    ( { tweets = Maybe.Nothing }, Cmd.none )



---- UPDATE ----


update : Msg -> State -> ( State, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- PROGRAM ----


main : Program Never State Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }

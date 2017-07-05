module View exposing (..)

import Model exposing (State)
import Html exposing (Html, text, div, h1)
import Message exposing (..)

view : State -> Html Msg
view model =
    div []
        [
          h1 [] [ text "Trainline tweet wall"],
          div [] [ text (toString <| List.length <| Maybe.withDefault [] model.tweets)]
        ]

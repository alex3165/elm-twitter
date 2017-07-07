module Subscriptions exposing (..)

import Model exposing (State)
import Message exposing (Msg, Msg(StreamTweets))
import WebSocket


getApi : String
getApi =
    "localhost:8002"


subscriptions : State -> Sub Msg
subscriptions model =
    WebSocket.listen ("ws://" ++ getApi ++ "/tweets") StreamTweets

module Update exposing (..)

import Message exposing (Msg, Msg(StreamTweets))
import Model exposing (State, Tweet)
import Json.Decode exposing (Decoder, decodeString)
import Serializer exposing (tweetDecoder)


update : Msg -> State -> ( State, Cmd Msg )
update msg model =
    case msg of
        StreamTweets str ->
            case (decodeString tweetDecoder str) of
                Ok val ->
                    case model.tweets of
                        Just tweets ->
                            ( { model | tweets = Just (val :: tweets) }, Cmd.none )

                        Nothing ->
                            ( { model | tweets = Just [ val ] }, Cmd.none )

                Err err ->
                    ( model, Cmd.none )

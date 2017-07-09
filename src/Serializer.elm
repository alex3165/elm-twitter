module Serializer exposing (..)

import Json.Decode exposing (Decoder, decodeString, int, list, string, nullable)
import Json.Decode.Pipeline exposing (decode, required, optional)
import Model exposing (..)

userDecoder : Decoder User
userDecoder =
    decode User
        |> required "name" string
        |> required "screen_name" string
        |> required "profile_image_url_https" string

tweetDecoder : Decoder Tweet
tweetDecoder =
    decode Tweet
        |> required "id" string
        |> required "created_at" string
        |> required "description" (list string)
        |> required "user" userDecoder
        |> optional "retweet" (nullable userDecoder) Maybe.Nothing
        |> optional "photos" (nullable (list string)) Maybe.Nothing

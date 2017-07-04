module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import OAuth

all : Test
all =
    describe "A Test Suite"
        [ test "Addition" <|
            \() ->
                Expect.equal 10 (3 + 7)
        , test "String.left" <| \() -> Expect.equal "a" (String.left 1 "abcdefg")
        , test "OAuth" <| \() -> Expect.equal OAuth.authorization "OAuthtest"
        ]

module Model exposing (..)


type alias User =
    { name : String
    , screen_name : String
    , profile_image_url_https : String
    }


type alias Tweet =
    { id : String
    , created_at : String
    , description : List String
    , user : User
    , retweet : Maybe User
    , photos : Maybe (List String)
    }


type alias State =
    { tweets : Maybe (List Tweet)
    }

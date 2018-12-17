module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline as DecodePipeline



---- MODEL ----


type alias Flags =
    { spotifyClientId : String
    , spotifySecret : String
    }


type alias Track =
    { id : Int
    , title : String
    }


type alias Chart =
    { tracks :
        { data : List Track
        }
    }


type alias Model =
    { spotifyClientId : String
    , spotifySecret : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { spotifyClientId = flags.spotifyClientId
      , spotifySecret = flags.spotifySecret
      }
    , Cmd.none
    )



---- JSON ----


trackDecoder : Decode.Decoder Track
trackDecoder =
    Decode.succeed Track
        |> DecodePipeline.required "id" Decode.int
        |> DecodePipeline.required "title" Decode.string



---- UPDATE ----


type Msg
    = FetchChart (Result Http.Error Chart)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- getDeezerChart : Cmd Msg
-- getDeezerChart =
--     Http.get
--         { url = "https://api.deezer.com/chart"
--         , expect = Http.expectJson FetchChart chartDecoder
--         }
---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.element
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

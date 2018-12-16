module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Http
import Json.Decode exposing (Decoder, string, succeed)
import Json.Decode.Pipeline exposing (required)



---- MODEL ----


type alias Flags =
    { spotifyClientId : String
    , spotifySecret : String
    }


type alias SpotifyAccess =
    { access_token : String }


type alias Model =
    { spotifyClientId : String
    , spotifySecret : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { spotifyClientId = flags.spotifyClientId
      , spotifySecret = flags.spotifySecret
      }
    , getSpotifyAccess flags.spotifyClientId
        flags.spotifySecret
    )



---- JSON ----


spotifyAccessDecoder =
    succeed SpotifyAccess
        |> required "access_token" string



---- UPDATE ----


type Msg
    = UpdateSpotifyAccess (Result Http.Error SpotifyAccess)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


getSpotifyAccess : String -> String -> Cmd Msg
getSpotifyAccess clientId secret =
    Http.request
        { method = "POST"
        , url = "https://accounts.spotify.com/api/token"
        , body =
            Http.stringBody "application/x-www-form-urlencoded"
                "grant_type=client_credentials"
        , headers =
            [ Http.header "Authorization"
                ("Basic " ++ clientId ++ ":" ++ secret)
            ]
        , expect = Http.expectJson UpdateSpotifyAccess spotifyAccessDecoder
        , timeout = Nothing
        , tracker = Nothing
        }



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

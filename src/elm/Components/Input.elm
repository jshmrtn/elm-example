module Components.Input exposing (..)

import Html exposing (input, Html)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onInput, onFocus, onBlur)


-- MODEL


type alias Model =
    String


init : Model -> ( Model, Cmd Msg )
init text =
    ( text, Cmd.none )



-- UPDATE


type Msg
    = Update Model
    | Focus
    | Blur


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Update value ->
            ( value, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    input
        [ type_ "text"
        , onInput Update
        , onFocus Focus
        , onBlur Blur
        , value model
        , Html.Attributes.placeholder "Max"
        ]
        []

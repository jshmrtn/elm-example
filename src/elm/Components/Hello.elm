module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    { name : String
    , counter : Int
    }



-- VIEW


view : Model -> Html a
view model =
    div []
        [ h1
            [ class "name-title" ]
            [ text ("Hello, " ++ model.name) ]
        , h2
            [ class "counter-title" ]
            [ text ("You are number " ++ (toString model.counter)) ]
        ]

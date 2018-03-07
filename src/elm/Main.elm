module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- COMPONENTS

import Components.Hello as Hello
import Components.Input as Input


-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { name : String
    , counter : Int
    , input : String
    }


model : Model
model =
    { name = "Astronaut"
    , counter = 1
    , input = ""
    }



-- UPDATE


type Msg
    = Change
    | InputMsg Input.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change ->
            case model.input of
                "" ->
                    { model | name = "Astronaut", counter = model.counter + 1 }

                input ->
                    { model | name = input, counter = model.counter + 1 }

        InputMsg inputMessage ->
            case inputMessage of
                Input.Update inputValue ->
                    { model | input = inputValue }

                _ ->
                    model



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ div [ class "row" ]
            [ div [ class "col-xs-12" ]
                [ div [ class "jumbotron" ]
                    [ Hello.view { name = model.name, counter = model.counter } -- ext 'hello' component (takes 'model' as arg)
                    , Html.map InputMsg (Input.view model.input)
                    , br [] []
                    , button [ class "btn btn-primary btn-lg", style styles.button, onClick Change ]
                        [ span [] [ text "Change Hello Name" ]
                        ]
                    ]
                ]
            ]
        ]



-- CSS STYLES


styles : { button : List ( String, String ) }
styles =
    { button =
        [ ( "margin-top", "20px" )
        , ( "padding", "10px" )
        , ( "border", "1px solid black" )
        ]
    }

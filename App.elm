module Main exposing (main)

import Html exposing (Html, button, div, img, text)
import Html.App exposing (program)
import Html.Attributes exposing (id, src, class)
import Html.Events exposing (onClick)
import Svg exposing (svg, circle, text')
import Svg.Attributes exposing (x, y, cx, cy, r, fill, fontSize, textAnchor, alignmentBaseline, width, height)
import Time exposing (every, millisecond)


main : Program Never
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    every (millisecond * 200) (always Increment)



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "main" ]
        [ everyThingThatMatters
        , arrow
        , elm
        , arrow
        , yourDreamAppearance model
        ]


elm =
    div [] [ img [ src "elm-logo.png" ] [] ]


everyThingThatMatters : Html Msg
everyThingThatMatters =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Increment ] [ text "+" ]
        ]


yourDreamAppearance : Model -> Html Msg
yourDreamAppearance model =
    div [ class "dream" ]
        [ if model < 0 then
            img [ src "alf.jpg" ] []
          else if model > 100 then
            img [ src "pia.jpg" ] []
          else
            theAnimation model
        ]


theAnimation : Model -> Html Msg
theAnimation model =
    svg [ width "200", height "200" ]
        [ circle [ cx "100", cy "100", r (toString model), fill elmOrange ] []
        , text'
            [ x "100"
            , y "100"
            , fontSize <| (toString model) ++ "px"
            , fill elmDarkblue
            , textAnchor "middle"
            , alignmentBaseline "middle"
            ]
            [ text <| toString model ]
        ]


arrow : Html Msg
arrow =
    div [ class "arrow" ] [ text "=>" ]



----- Colors


elmDarkblue =
    "#474E63"


elmGreen =
    "#7CD12A"


elmLightblue =
    "#50A5C0"


elmOrange =
    "#E89409"

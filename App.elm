module Main exposing (main)

import Html exposing (button, div, img, text)
import Html.App exposing (program)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import Svg exposing (svg, circle, text')
import Svg.Attributes exposing (..)
import Time exposing (every, millisecond)


main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


init =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- SUBSCRIPTIONS


subscriptions model =
    every (millisecond * 200) (always Increment)



-- VIEW


view model =
    div [ boxStyle, mainStyle, largeText ]
        [ everyThingThatMatters
        , arrow
        , inlineDiv [ img [ src "elm-logo.png" ] [] ]
        , arrow
        , yourDreamAppearance model
        ]


everyThingThatMatters =
    inlineDiv
        [ button [ buttonStyle, onClick Decrement ] [ text "-" ]
        , button [ buttonStyle, onClick Increment ] [ text "+" ]
        ]


yourDreamAppearance model =
    div (boundedBox :: [ inline ])
        [ if model < 0 then
            img [ src "alf.jpg", Html.Attributes.width 200 ] []
          else if model > 100 then
            img [ src "pia.jpg", Html.Attributes.width 200 ] []
          else
            theAnimation model
        ]


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


arrow =
    div (arrowStyle :: inlineDivStyles) [ text "=>" ]


inlineDiv elements =
    div inlineDivStyles elements



----- STYLING


mainStyle =
    Html.Attributes.style
        [ ( "font-family", "Helvetica" )
        , ( "color", elmDarkblue )
        ]


boxStyle =
    Html.Attributes.style [ ( "padding", "30px" ) ]


buttonStyle =
    Html.Attributes.style
        [ ( "font-size", "24px" )
        , ( "background-color", "#7CD12A" )
        , ( "border", "none" )
        , ( "border-radius", "4px" )
        , ( "min-height", "45px" )
        , ( "min-width", "45px" )
        , ( "margin", "5px" )
        ]


arrowStyle =
    Html.Attributes.style
        [ ( "font-size", "64px" ) ]


boundedBox =
    Html.Attributes.style
        [ ( "height", "200px" )
        , ( "border", "4px solid " ++ elmLightblue )
        , ( "border-radius", "4px" )
        ]


appearanceTextStyle =
    Html.Attributes.style
        [ ( "font-size", "128px" )
        , ( "padding", "30px 60px 30px 60px" )
        ]


largeText =
    Html.Attributes.style [ ( "font-size", "24px" ) ]


inline =
    Html.Attributes.style
        [ ( "display", "inline-block" )
        , ( "vertical-align", "middle" )
        ]


inlineDivStyles =
    [ boxStyle, inline ]


elmDarkblue =
    "#474E63"


elmGreen =
    "#7CD12A"


elmLightblue =
    "#50A5C0"


elmOrange =
    "#E89409"

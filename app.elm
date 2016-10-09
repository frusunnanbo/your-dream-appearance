module Main exposing (main)

import Html exposing (button, div, img, text)
import Html.App exposing (program)
import Html.Attributes exposing (style, src)
import Html.Events exposing (onClick)
import Svg exposing (svg, circle, text')
import Svg.Attributes exposing (width, height, cy, cx, r, fill, fontSize, x, y, textAnchor, alignmentBaseline)
import Time exposing (every, second)


main =
    program { init = init, update = update, subscriptions = subscriptions, view = view }



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
    every second (always Increment)



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
    div (appearanceStyle :: [ inline ])
        [ yourSvgDream model
        ]


yourSvgDream model =
    svg [ width "200", height "200" ]
        [ circle [ cx "100", cy "100", r (toString (model * 2)), fill elmOrange ] []
        , text' [ x "100", y "100", fontSize <| (toString (model * 2)) ++ "px", fill elmDarkblue, textAnchor "middle", alignmentBaseline "middle" ] [ text <| toString model ]
        ]


arrow =
    div (arrowStyle :: inlineDivStyles) [ text "=>" ]


inlineDiv elements =
    div inlineDivStyles elements



----- STYLING


mainStyle =
    style
        [ ( "font-family", "Helvetica" )
        , ( "color", elmDarkblue )
        ]


boxStyle =
    style [ ( "padding", "30px" ) ]


buttonStyle =
    style
        [ ( "font-size", "24px" )
        , ( "background-color", "#7CD12A" )
        , ( "border", "none" )
        , ( "border-radius", "4px" )
        , ( "min-height", "45px" )
        , ( "min-width", "45px" )
        , ( "margin", "5px" )
        ]


arrowStyle =
    style
        [ ( "font-size", "64px" ) ]


appearanceStyle =
    style
        [ ( "height", "200px" )
        , ( "border", "4px solid " ++ elmLightblue )
        , ( "border-radius", "4px" )
        ]


appearanceTextStyle =
    style
        [ ( "font-size", "128px" )
        , ( "padding", "30px 60px 30px 60px" )
        ]


largeText =
    style [ ( "font-size", "24px" ) ]


inline =
    style
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

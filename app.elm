module Main exposing (..)

import Html exposing (div, img, text)
import Html.Attributes exposing (style, src)


main : Html.Html msg
main =
    div [ boxStyle, mainStyle, largeText ]
        [ inlineDiv [ text "Everything that matters" ]
        , arrow
        , inlineDiv [ img [ src "elm-logo.png" ] [] ]
        , arrow
        , inlineDiv [ text "Your dream appearance." ]
        ]


arrow =
    div (arrowStyle :: inlineDivStyles) [ text "=>" ]


inlineDiv elements =
    div inlineDivStyles elements



----- STYLING -------


mainStyle =
    style [ ( "font-family", "Helvetica" ) ]


boxStyle =
    style [ ( "padding", "30px" ) ]


arrowStyle =
    style
        [ ( "font-size", "64px" )
        , ( "color", "#474E63" )
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

import Html exposing (div, text)
import Html.Attributes exposing (style)

main : Html.Html msg
main =
  div [ boxStyle, mainStyle, largeText ] [ text "Your dream appearance." ]


boxStyle =
  style [ ("padding", "30px") ]

mainStyle =
  style [ ("font-family", "Helvetica") ]

largeText =
  style [ ("font-size", "24px") ]

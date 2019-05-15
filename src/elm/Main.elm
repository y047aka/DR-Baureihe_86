module Main exposing (main)

import Browser
import Html exposing (img)
import Html.Attributes exposing (src)
import TypedSvg exposing (circle, g, rect, svg)
import TypedSvg.Attributes exposing (class, fill, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, width, x, y)
import TypedSvg.Core exposing (Svg)


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { userState : String }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model ""
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "DR-Baureihe 86"
    , body =
        [ img [ src "./images/base.png" ] []
        , svg
            [ width 322
            , height 416.5
            , viewBox -1610 0 3220 4165
            ]
            [ boiler
            , headLight
            , numberPlate
            , fogLamps
            ]
        ]
    }


boiler : Svg msg
boiler =
    let
        centerX =
            0

        centerY =
            1510
    in
    g [ class [ "boiler" ] ]
        [ circle [ cx centerX, cy centerY, r 790 ] []
        , circle [ cx centerX, cy centerY, r 670 ] []
        , circle [ cx centerX, cy centerY, r 645 ] []
        , circle [ cx centerX, cy centerY, r 620 ] []
        , circle [ cx centerX, cy centerY, r 520 ] []
        , circle [ cx centerX, cy centerY, r 500 ] []
        ]


headLight : Svg msg
headLight =
    let
        centerX =
            0

        centerY =
            980
    in
    g [ class [ "head-light" ] ]
        [ circle [ cx centerX, cy centerY, r 150 ] []
        , circle [ cx centerX, cy centerY, r 120 ] []
        , circle [ cx centerX, cy centerY, r 90 ] []
        ]


numberPlate : Svg msg
numberPlate =
    let
        w =
            650

        h =
            180

        cx =
            -(w / 2)

        cy =
            1510 - (h / 2)
    in
    g [ class [ "number-plate" ] ]
        [ rect [ x cx, y cy, width w, height h ] []
        ]


fogLamps : Svg msg
fogLamps =
    g []
        [ fogLamp 820
        , fogLamp -820
        ]


fogLamp : Float -> Svg msg
fogLamp centerX =
    let
        centerY =
            2590
    in
    g [ class [ "fog-lamp" ] ]
        [ circle [ cx centerX, cy centerY, r 150 ] []
        , circle [ cx centerX, cy centerY, r 120 ] []
        , circle [ cx centerX, cy centerY, r 90 ] []
        ]

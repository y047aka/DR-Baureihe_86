module Main exposing (main)

import Browser
import Html exposing (img)
import Html.Attributes exposing (src)
import TypedSvg exposing (circle, g, polygon, rect, svg)
import TypedSvg.Attributes exposing (class, fill, points, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, rx, ry, width, x, y)
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


type RL
    = R
    | L


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
            [ width 644
            , height 833
            , viewBox -1605 0 3210 4165
            ]
            [ g []
                [ chassis
                , cabin
                , body
                , deck
                , windows
                ]
            , g []
                [ steamHeader
                , chimney
                , boiler
                , cylinders
                ]
            , g []
                [ headLight
                , numberPlate
                , coupler
                ]
            ]
        ]
    }


cabin : Svg msg
cabin =
    g []
        [ polygon
            [ x 100
            , y 1500
            , points
                [ ( -1460, 1500 )
                , ( -1250, 600 )
                , ( -1060, 380 )
                , ( -550, 200 )
                , ( -150, 150 )
                , ( 150, 150 )
                , ( 550, 200 )
                , ( 1060, 380 )
                , ( 1250, 600 )
                , ( 1460, 1500 )
                ]
            ]
            []
        ]


body : Svg msg
body =
    g []
        [ let
            w =
                2920
          in
          rect [ x -(w / 2), y 1500, width w, height 1020 ] []
        ]


chassis : Svg msg
chassis =
    g []
        [ let
            w =
                1050
          in
          rect [ x -(w / 2), y 3265, width w, height 600 ] []
        , wheel R
        , wheel L
        ]


wheel : RL -> Svg msg
wheel rl =
    let
        sign =
            case rl of
                R ->
                    1

                L ->
                    -1

        centerX =
            650 * sign

        centerY =
            3200
    in
    g [ class [ "wheel" ] ]
        [ rect [ x centerX, y centerY, width 150, height 890 ] []
        , polygon
            [ points
                [ ( 620, 3125 )
                , ( 650, 3200 )
                , ( 650, 4090 )
                , ( 620, 4165 )
                ]
            ]
            []
        ]


deck : Svg msg
deck =
    g []
        [ polygon
            [ x 100
            , y 1500
            , points
                [ ( 380, 2200 )
                , ( 380, 2300 )
                , ( 710, 2300 )
                , ( 1000, 2200 )
                , ( 1290, 2200 )
                , ( 1290, 2250 )
                , ( 710, 2450 )
                , ( -710, 2450 )
                , ( -1290, 2250 )
                , ( -1290, 2200 )
                , ( -1000, 2200 )
                , ( -710, 2300 )
                , ( -380, 2300 )
                , ( -380, 2200 )
                ]
            ]
            []
        , let
            w =
                580
          in
          g []
            [ rect [ x (1150 - (w / 2)), y 2140, width w, height 60 ] []
            , rect [ x (-1150 - (w / 2)), y 2140, width w, height 60 ] []
            ]
        , let
            w =
                620
          in
          g []
            [ rect [ x (1150 - (w / 2)), y 2110, width w, height 30 ] []
            , rect [ x (-1150 - (w / 2)), y 2110, width w, height 30 ] []
            ]
        , let
            w =
                40
          in
          g []
            [ rect [ x (465 - (w / 2)), y 2170, width w, height 725 ] []
            , rect [ x (-465 - (w / 2)), y 2170, width w, height 725 ] []
            ]
        ]


windows : Svg msg
windows =
    g []
        [ let
            w =
                1390
          in
          rect [ x -(w / 2), y 305, width w, height 200, rx 100, ry 100 ] []
        , let
            w =
                1320
          in
          rect [ x -(w / 2), y 340, width w, height 130, rx 65, ry 65 ] []
        ]


steamHeader : Svg msg
steamHeader =
    g [ class [ "chimney" ] ]
        [ let
            w =
                620
          in
          rect [ x -(w / 2), y 200, width w, height 700, rx 310, ry 160 ] []
        ]


chimney : Svg msg
chimney =
    g [ class [ "chimney" ] ]
        [ let
            w =
                460
          in
          rect [ x -(w / 2), y 115, width w, height 35, rx 20, ry 20 ] []
        , polygon [ points [ ( 215, 150 ), ( 200, 730 ), ( -200, 730 ), ( -215, 150 ) ] ] []
        , let
            w =
                1260
          in
          rect [ x -(w / 2), y 730, width w, height 460 ] []
        , rect [ x -750, y 730, width 120, height 460 ] []
        ]


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



-- COUPLER


coupler : Svg msg
coupler =
    g [ class [ "coupler" ] ]
        [ frame
        , fogLamps
        , buffers
        ]


frame : Svg msg
frame =
    let
        w =
            2140

        h =
            370

        centerX =
            -(w / 2)

        centerY =
            3080 - (h / 2)
    in
    g [ class [ "frame" ] ]
        [ rect [ x centerX, y centerY, width w, height h ] []
        , rect [ x centerX, y centerY, width w, height 30 ] []
        , g
            []
            ([ -380, -110, 110, 380 ]
                |> List.map
                    (\d ->
                        g []
                            [ circle [ cx d, cy (centerY + 120), r 15 ] []
                            , circle [ cx d, cy (centerY + 290), r 15 ] []
                            ]
                    )
            )
        ]


fogLamps : Svg msg
fogLamps =
    g []
        [ fogLamp L
        , fogLamp R
        ]


fogLamp : RL -> Svg msg
fogLamp rl =
    let
        sign =
            case rl of
                R ->
                    1

                L ->
                    -1

        centerX =
            825 * sign

        centerY =
            2590
    in
    g [ class [ "fog-lamp" ] ]
        [ circle [ cx centerX, cy centerY, r 140 ] []
        , circle [ cx centerX, cy centerY, r 110 ] []
        , circle [ cx centerX, cy centerY, r 100 ] []
        ]


buffers : Svg msg
buffers =
    g []
        [ buffer L
        , buffer R
        ]


buffer : RL -> Svg msg
buffer rl =
    let
        sign =
            case rl of
                R ->
                    1

                L ->
                    -1

        centerX =
            825 * sign

        centerY =
            3100
    in
    g [ class [ "buffer" ] ]
        [ circle [ cx centerX, cy centerY, r 205 ] []
        , circle [ cx centerX, cy centerY, r 190 ] []
        ]


cylinders : Svg msg
cylinders =
    g []
        [ cylinder L
        , cylinder R
        ]


cylinder : RL -> Svg msg
cylinder rl =
    let
        sign =
            case rl of
                R ->
                    1

                L ->
                    -1

        largeCenterX =
            1175 * sign

        largeCenterY =
            3410

        smallCenterX =
            1350 * sign

        smallCenterY =
            2840
    in
    g [ class [ "cylinder" ] ]
        [ g []
            [ circle [ cx largeCenterX, cy largeCenterY, r 340 ] []
            , circle [ cx largeCenterX, cy largeCenterY, r 255 ] []
            , circle [ cx largeCenterX, cy largeCenterY, r 130 ] []
            ]
        , g []
            [ circle [ cx smallCenterX, cy smallCenterY, r 200 ] []
            , circle [ cx smallCenterX, cy smallCenterY, r 150 ] []
            , circle [ cx smallCenterX, cy smallCenterY, r 55 ] []
            ]
        ]

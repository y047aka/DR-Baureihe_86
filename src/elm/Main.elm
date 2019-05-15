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
            [ boiler
            , headLight
            , numberPlate
            , coupler
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

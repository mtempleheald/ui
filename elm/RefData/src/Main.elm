module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser exposing (Parser, (</>), int, map, oneOf, s, string)

import RefData exposing (..)
import Page.RefDataHome exposing (..)
import Page.RefDataTestMapping exposing (..)
import Page.RefDataContext exposing (..)
import Page.RefDataList exposing (..)
import Page.RefDataMappingList exposing (..)
import Page.RefDataValueMapping exposing (..)


-- MAIN


main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }


type Route
  = RefData
  | RefDataContext String
  | RefDataList String String 
  | RefDataValue String String String
  | Mapping 

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ Url.Parser.map RefData        (Url.Parser.s "refdata") -- /refdata
    , Url.Parser.map RefDataContext (Url.Parser.s "refdata" </> string) -- /refdata/<context>
    -- , Url.Parser.map RefDataContexts    (Url.Parser.s "refdata" </> string </> Url.Parser.s "lists") -- /refdata/<context>/lists
    , Url.Parser.map RefDataList    (Url.Parser.s "refdata" </> string </> Url.Parser.s "lists" </> string) -- /refdata/<context>/lists/<list>
    --, Url.Parser.map RefDataLists   (Url.Parser.s "refdata" </> string </> Url.Parser.s "lists" </> string </> Url.Parser.s "values") -- /refdata/<context>/lists/<list>/values/<value>
    , Url.Parser.map RefDataValue   (Url.Parser.s "refdata" </> string </> Url.Parser.s "lists" </> string </> Url.Parser.s "values" </> string) -- /refdata/<context>/lists/<list>/values/<value>
    , Url.Parser.map Mapping        (Url.Parser.s "mapping")
    ]


-- MODEL


type alias Model =
  { navKey : Nav.Key
  , route : Maybe Route
  , contexts : Maybe RefContexts
  , contextsData : String
  }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
  ( { navKey = navKey
    , route = Nothing
    , contexts = Nothing
    , contextsData = """
    {
    "contexts": [
        {
            "key": "cdl-classic",
            "desc": "CDL-managed lists supporting the Classic product",
            "type": "external"
        },
        {
            "key": "cdl-strata",
            "desc": "CDL-managed lists supporting the Strata product",
            "type": "external"
        },
        {
            "key": "atlanta",
            "desc": "Atlanta-controlled, general purpose lists",
            "type": "internal"
        },
        {
            "key": "carolenash",
            "desc": "Atlanta-controlled, brand-specific lists",
            "type": "internal"
        },
        {
            "key": "motorbike",
            "desc": "Atlanta-controlled, product-specific lists",
            "type": "internal"
        },
        {
            "key": "carolenash-motorbike",
            "desc": "Atlanta-controlled, brand & product specific lists",
            "type": "internal"
        }
    ]
}
"""
  }
  , Cmd.none )


-- UPDATE


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.navKey (Url.toString url) )
        Browser.External href ->
          ( model, Nav.load href )
    UrlChanged url ->
      ( { model | route = Url.Parser.parse routeParser url }
      , Cmd.none
      )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
  { title = "Ref Data Management"
  , body = [
      h1 [] [ a [ href "/" ] [ text "Reference Data Management" ] ]
    , nav [] [
        ul [ class "menu" ] [
          a [ href "/refdata" ] [ text "Reference Data" ]
        , a [ href "/mapping" ] [ text "Mapping Rules" ]
        ]
      ]
    , case model.route of
        Nothing -> text "Click on reference data to get started"
        Just RefData ->
          div [][
            ul [ class "breadcrumb" ] [
              li [][ text "home" ]
            ]
          , div [][ text "TODO - add context form" ]
          , table [][
              thead [][
                th [][ text "Context" ]
              , th [][ text "Description" ]
              ]
            , tbody [] (List.map viewContextTableRow ["cdl-classic", "cdl-strata", "atlanta", "atlanta-motorbike", "carolenash", "carolenash-motorbike"])
            ]
          ]
        Just (RefDataContext ctx) ->
            div [][
              ul [ class "breadcrumb" ] [
                li [][ a [href "/refdata"] [ text "home" ] ]
              , li [][ text ctx ]
              ]
            , div [][ text "TODO - form for editing context details" ]
            , table [][
                thead [][
                  th [][ text "List" ]
                , th [][ text "Description" ]
                ]
              , tbody [][
                  tr [][
                    td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ "person-title")] [ text "person-title"] ]
                  , td [][ text "List of titles" ]
                  ]
                , tr [][
                    td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ "insurance-type")] [ text "insurance-type"] ]
                  , td [][ text "List of insurance types" ]
                  ]
                ]
              ]
            ]
        Just (RefDataList ctx list) ->
            div [][
              ul [ class "breadcrumb" ] [
                li [][ a [href "/refdata"] [ text "home" ] ]
              , li [][ a [href ("/refdata/" ++ ctx) ] [ text ctx ] ]
              , li [][ text list ]
              ]
            , div [][text "TODO - form for editing list details" ]
            , table [][
                thead [][
                  th [][ text "Key" ],
                  th [][ text "Value" ],
                  th [][ text "Order" ],
                  th [][ text "Hidden" ]
                ],
                -- tbody [][
                --   (List.map viewValueTableRow [{ctx, list, "MR", "Mr", "2", ""}, {ctx, list, "MRS", "Mrs", "1", ""}])
                -- ],
                tr [][
                  td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ "MR")] [ text "MR" ] ],
                  td [][ text "Mr"],
                  td [][ text "2"],
                  td [][]
                ],
                tr [][
                  td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ "MRS")] [ text "MRS" ] ],
                  td [][ text "Mrs"],
                  td [][ text "1"],
                  td [][]
                ],
                tr [][
                  td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ "MS")] [ text "MS" ] ],
                  td [][ text "Ms"],
                  td [][ text "3"],
                  td [][]
                ],
                tr [][
                  td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ "MISS")] [ text "MISS" ] ],
                  td [][ text "Miss"],
                  td [][ text "4"],
                  td [][]
                ],
                tr [][
                  td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ "DR")] [ text "DR" ] ],
                  td [][ text "Dr"],
                  td [][],
                  td [][ text "true"]
                ]
              ]
            ]
        Just (RefDataValue ctx list value) ->
            div [][
              ul [ class "breadcrumb" ] [
                li [][ a [href "/refdata"] [ text "home" ] ]
              , li [][ a [href ("/refdata/" ++ ctx) ] [ text ctx ] ]
              , li [][ a [href ("/refdata/" ++ ctx ++ "/lists/" ++ list) ] [ text list ] ]
              , li [][ text value ]
              ]
            , div [][ text "TODO - Form for editing value"]
            ]
        Just Mapping ->
            div [][
              div [][ text "Some mapping rules between context/list A and context/list B" ]
            , table [][
              thead [][
                tr [][
                  th [][ text "Context A" ]
                , th [][ text "List A" ]
                , th [][ text "Context B" ]
                , th [][ text "List B" ]
                , th [][ text "Transformation rules" ]
                ]
              ]
            , tbody [][
                tr [][
                  td [][ text "atlanta" ]
                , td [][ text "person-title" ]
                , td [][ text "cdl-classic" ]
                , td [][ text "title" ]
                , td [][ text "filter" ]
                ]
              , tr [][
                  td [][ text "atlanta-motorbike" ]
                , td [][ text "vehicle-modification" ]
                , td [][ text "cdl-strata" ]
                , td [][ text "BikeModification" ]
                , td [][ text "manual-mapping" ]
                ]
              ]
            ]
          ]
    ]
  }

viewContextTableRow : String -> Html msg
viewContextTableRow ctx = 
  tr [][
    td [][ a [href ("/refdata/" ++ ctx)] [text ctx] ]
  , td [][ text ("Context description for " ++ ctx) ]
  ]

viewValueTableRow: String -> String -> String -> String -> String -> String -> Html msg
viewValueTableRow ctx list key val ord vis = 
  tr [][
    td [][ a [ href ("/refdata/" ++ ctx ++ "/lists/" ++ list ++ "/values/" ++ key) ] [ text key ] ],
    td [][ text val],
    td [][ text ord],
    td [][ text vis]
  ]

viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]

viewRoute : Maybe Route -> Html msg
viewRoute maybeRoute =
  case maybeRoute of
    Nothing ->
      li [] [ text "Route not yet implemented"] -- any invalid links will redirect home (feels like an assumption, needs thought on how to do both things in a reasonable way)

    Just route ->
      li [] [ code [] [ text (routeToString route) ] ]

routeToString : Route -> String
routeToString route =
  case route of
    RefData ->
      "Show ref data contexts"
    RefDataContext context ->
      "Show ref data context " ++ context ++ " and its lists"
    RefDataList context list ->
      "Show values of ref data list " ++ context ++ "/" ++ list
    RefDataValue context list value ->
      "Show ref data value " ++ context ++ "/" ++ list ++ "/" ++ value
    Mapping ->
      "Reference Data Mapping"
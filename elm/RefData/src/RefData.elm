module RefData exposing (RefContexts, RefContext, RefLists, RefList, RefValues, RefValue, displayStatusDecoder, contextDecoder)

import Json.Decode as Decode exposing (Decoder, bool, int, maybe, nullable, string)
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import Json.Encode as Encode

type alias RefContext = 
  { key : String
  , desc : Maybe String
  , ctxType : String
  }
type alias RefContexts = List RefContext

type alias RefList =
  { ctxKey : String
  , key : String
  , desc : Maybe String
  }
type alias RefLists = List RefList

type DisplayStatus = Visible | Hidden
type alias RefValue =
  { ctxKey : String
  , listKey : String
  , key : String
  , value : String
  , order : Maybe Int
  , visibility : DisplayStatus
  }
type alias RefValues = List RefValue

-- SERIALIZATION
-- Json.Decode.Pipeline https://github.com/NoRedInk/elm-json-decode-pipeline


contextDecoder : Decoder RefContext
contextDecoder =
  Decode.succeed RefContext
    |> required "key" string
    |> required "desc" (nullable string)
    |> required "type" string

listDecoder : Decoder RefList
listDecoder =
  Decode.succeed RefList
    |> required "context" string
    |> required "key" string
    |> required "desc" (nullable string)

valueDecoder : Decoder RefValue
valueDecoder =
  Decode.succeed RefValue
    |> required "context" string
    |> required "list" string
    |> required "key" string
    |> required "value" string
    |> optional "order" (maybe int) Nothing
    |> required "hidden" displayStatusDecoder -- want {.."hidden" : true..} in the JSON but display = Hidden|Visible in the code

-- decode a boolean from json as a string and default to false if missing
stringBoolDecoder : Decoder Bool
stringBoolDecoder =
  Decode.string
    |> Decode.andThen (\str ->
         case str of
           "true" -> Decode.succeed True
           _      -> Decode.succeed False
       )
-- convert from JSON bool (possibly missing) to union type
displayStatusDecoder : Decoder DisplayStatus
displayStatusDecoder = 
  Decode.string
    |> Decode.andThen (\str ->
         case str of
           "true" -> Decode.succeed Visible
           _      -> Decode.succeed Hidden
       )

-- without Json Decode Pipeline:
-- contextDecoder : Decoder Context
-- contextDecoder =
--   Decode.map2 Context
--     (Decode.field "key"  Decode.string)
--     (Decode.field "desc" Decode.string)

-- encode : Context -> Encode.Value
-- encode ctx =
--   Encode.object
--     [ ("key", Encode.string ctx.key)
--     , ("desc", Encode.string ctx.desc)
--     ]
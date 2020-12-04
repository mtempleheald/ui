# Readme

Learn Elm while creating a SPA demonstrating required reference data management features.


## Modules

- Main - lightweight control plane only
- RefData
  - backend service API data structures
  - encode/decode data from API
  - data structures to support page logic
- Page.RefData - Home page for refdata management - list available contexts
- Page.RefDataContext - View/Edit context + view related lists
- Page.RefDataList - View/Edit list + view/edit related values
- Page.RefDataListMapping - Manage tranformation rules governing list interaction
- Page.RefDataValueMapping - Manage value mappings for suitable list mapping types
- Page.RefDataTestMapping - Test mappings on screen

## Thoughts on design

View == HTML == What people see.
App == Elm == routing, master model and glue tying modules together.
Module == Data Type == focused data models, business logic & service integration

Reference data to be stored in relational DB, but this within a service layer.
This app is just a front end on the API layer - thus knows about business keys but not internal identifiers.
Therefore although we know there is an inherent relationship between context, lists and values, these can be considered independent data structures, referenced by key.

This app is meant to primarily display but also later update reference data.
Need separate models for read and write but optimise for read.

View --> App (Init | Update) --> Modules --> View
1. User action triggers update.
1. Update delegates actions to relevant module
1. Module performs 

- View (/) --> App.Init --> View
- View (/refdata) --> App.Update --> RefData.LoadContexts
                                 --> View
- View (/refdata/{ctx1}) --> App.Update --> RefData.LoadContext 
                                        --> RefData.LoadLists
                                        --> View



## TODO 

- routeToBreadcrumb to replace routeToString
- tidy up table creation using helper functions
- Add module for each page and move code to it
- Add refdata mapping module
- load from json during init (hard coded json for now)
- load json from external file
- Add forms to edit data too
- load json from external API
- styling - e.g. tabs came from https://codepen.io/kazzkiq/pen/qEMjaw/

Learn more from https://github.com/rtfeldman/elm-spa-example/tree/master/src

## Modules

[Elm JSON Decode Pipeline](https://package.elm-lang.org/packages/NoRedInk/elm-json-decode-pipeline/latest)


## Build & Run

Compile to Elm.js (from root folder):
```Elm
elm make src/Main.elm --output=main.js
```

For production (https://github.com/rtfeldman/elm-spa-example):
```Elm
elm make src/Main.elm --output elm.js --optimize

uglifyjs elm.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters=true,keep_fargs=false,unsafe_comps=true,unsafe=true,passes=2' --output=elm.js && uglifyjs elm.js --mangle --output=elm.js
```

Run app to test locally (from src folder):
```Elm
elm reactor
```
then click on src/Main.elm
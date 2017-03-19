module Models exposing (..)


type alias Id =
    String


type alias Price =
    Float


type alias Game =
    { id : Id
    , sold : Bool
    , name : String
    , comment : String
    , price : Price
    }


initGame : ( Id, String, String, Price ) -> Game
initGame ( s, n, c, p ) =
    { id = s
    , sold = False
    , name = n
    , comment = c
    , price = p
    }


type alias Model =
    { games : List Game
    }


initModel : Model
initModel =
    { games = []
    }

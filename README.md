# Module Documentation

## Module History

### Types

    data History :: !


### Values

    getHash :: forall e. Eff (history :: History | e) String

    getUrl :: forall e. Eff (history :: History | e) String

    onUrlChange :: forall e. (String -> Eff e Unit) -> Eff (history :: History | e) Unit

    pushState :: forall e. String -> String -> Eff (history :: History | e) Unit

    pushUrl :: forall e. String -> Eff (history :: History | e) Unit


## Module History.Router

### Types

    data Router :: * -> !


### Type Classes

    class IsRoute r where
      fromHash :: String -> Maybe r
      toHash :: r -> String
      errorRoute :: r


### Type Class Instances

    instance routeString :: IsRoute String


### Values

    goto :: forall e r. (IsRoute r) => r -> Eff (router :: Router r | e) Unit

    route :: forall e r. (IsRoute r) => (r -> Eff (router :: Router r | e) Unit) -> Eff (history :: History, router :: Router r | e) Unit

    runHistory :: forall e r. (IsRoute r) => Eff (history :: History | e) Unit -> Eff (router :: Router r | e) Unit
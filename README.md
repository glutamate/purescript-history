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


### Values
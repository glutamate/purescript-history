# Module Documentation

## Module History

### Types

    data History :: !


### Values

    pushState :: forall e. String -> String -> Eff (history :: History | e) Unit
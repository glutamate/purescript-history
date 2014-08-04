module Example.Main where

import Control.Monad.Eff
import Control.Monad.Eff.Random
import Debug.Trace
import History
import Data.Tuple

foreign import data Alert :: !

foreign import alert
  "function alert(s) { \
  \  return function() { \
  \    window.alert(s); \
  \  }; \
  \};" :: forall r. String -> Eff (alert :: Alert | r) Unit

main = do
  rand <- random
  onUrlChange callback
  pushUrl "baz"
  url <- getHash
  trace $ url

  trace $ "hello purescript: " ++ show rand
  pushUrl "foo"

callback newurl = do
  trace $ "callback new url" ++ newurl

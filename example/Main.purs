module Example.Main where

import Control.Monad.Eff
import Control.Monad.Eff.Random
import Debug.Trace
import History
import History.Router
import Data.Tuple
import Data.Maybe

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
  route dispatch

dispatch s = goto "from_dispatcher"

callback newurl = do
  trace $ "callback new url" ++ newurl

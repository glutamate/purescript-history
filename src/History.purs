module History
 ( History()
 ) where

import Control.Monad.Eff
import Data.Enum
import Data.Maybe
import Data.Tuple

foreign import data History :: !

foreign import pushState
  " function pushState(title) { \
  \   return function(url) { \
  \     return function() { \
  \       console.log(title, url); \
  \       History.pushState({}, title, url); \
  \     } \
  \   } \
  \ } \
  \" :: forall e. String -> String -> Eff (history :: History | e) Unit

foreign import getState "" :: forall e. Eff (history :: History | e) (Tuple String String)

foreign import onState "" :: forall e. (Tuple String String -> Eff (history :: History | e) Unit)
                                       -> Eff (history :: History | e) Unit

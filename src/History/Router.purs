module History.Router
 ( Router()
 ) where

import Control.Monad.Eff
import Data.Enum
import Data.Maybe
import Data.Tuple
import History

foreign import data Router :: * -> !

class IsRoute r where
  fromHash :: String -> Maybe r
  toHash :: r -> String
  errorRoute :: r

route :: forall e r. (IsRoute r) => (r -> Eff (router :: Router r | e) Unit)
                                    -> Eff (router :: Router r, history:: History | e) Unit
route dispatcher = onUrlChange $ \hash -> do
  case fromHash hash of
    Nothing -> dispatcher errorRoute
    Just r -> dispatcher r

goto :: forall e r. (IsRoute r) => r -> Eff (router :: Router r | e) Unit
goto r = runHistory $ pushUrl $ toHash r

foreign import runHistory
  " function runHistory(f) { \
  \    return function() { \
  \      f(); \
  \    } \
  \ } \
  \ " :: forall e.  Eff (history :: History | e) Unit -> Eff e Unit
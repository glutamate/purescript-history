module History
 ( History()
 ) where

import Control.Monad.Eff
import Data.Enum
import Data.Maybe

foreign import data History :: !

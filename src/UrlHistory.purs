module UrlHistory
 ( UrlHistory()
 , pushState
 ) where

import Control.Monad.Eff
import Data.Enum
import Data.Maybe
import Data.Tuple

foreign import data UrlHistory :: !

foreign import pushState
  " function pushState(title) { \
  \   return function(url) { \
  \     return function() { \
  \       console.log(title, url); \
  \       History.pushState({}, title, url); \
  \     } \
  \   } \
  \ } \
  \" :: forall e. String -> String -> Eff (urlHistory :: UrlHistory | e) Unit

foreign import getState "" :: forall e. Eff (urlHistory :: UrlHistory | e) (Tuple String String)

foreign import onState "" :: forall e. (Tuple String String -> Eff (urlHistory :: UrlHistory | e) Unit)
                                       -> Eff (urlHistory :: UrlHistory | e) Unit

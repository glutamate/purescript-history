module History
 ( History()
 , pushState
 , pushUrl
 , getUrl
 , getHash
 , onUrlChange
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
  \       History.pushState({}, title, url); \
  \     } \
  \   } \
  \ } \
  \ " :: forall e. String -> String -> Eff (history :: History | e) Unit

foreign import pushUrl
  " function pushUrl(url) { \
  \     return function() { \
  \       History.pushState({}, undefined, url); \
  \     } \
  \ } \
  \ " :: forall e. String -> Eff (history :: History | e) Unit

foreign import getUrl
  " function getUrl() { \
  \   var State = History.getState(); \
  \   return State.url; \
  \ } \
  \ " :: forall e. Eff (history :: History | e) String

foreign import getHash
  " function getHash() { \
  \   return History.getHash(); \
  \ } \
  \ " :: forall e. Eff (history :: History | e) String

foreign import onUrlChange
  " function onUrlChange(callback) { \
  \    return function() { \
  \      History.Adapter.bind(window,'statechange',function() { \
  \        var h = History.getHash(); \
  \        callback(h)(); \
  \      }); \
  \    } \
  \ } \
  \ " :: forall e. (String -> Eff (history :: History | e) Unit)
                  -> Eff (history :: History | e) Unit

--doesn't work, need loading before loading history script.
foreign import setHtml4Mode
  " function setHtml4Mode(b) { \
  \   return function() { \
  \     History.options.html4Mode = b; \
  \   } \
  \ } \
  \ " :: forall e. Boolean -> Eff (history :: History | e) Unit

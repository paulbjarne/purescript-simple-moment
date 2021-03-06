-- Run with:
-- pulp build -I example && pulp run -m Example.Main
module Example.Main where

import Prelude
import Control.Monad.Eff.Console
import Data.Date
import Data.Time
import Data.Maybe

import qualified Data.Moment.Simple as M
import qualified Data.Moment.Simple.Relative as M

main = do
  tNow <- now
  nowCal <- M.calendar $ M.fromDate tNow
  print nowCal -- "Today at 9:47 PM"

  nowStr <- M.fromNow $ M.fromDate tNow
  print nowStr -- "a few seconds ago"

  let tThen = M.fromDate <$> fromStringStrict "2015-09-09T10:20:00.001Z"
  maybe (pure "<invalid>") (M.format "ddd, hA") tThen >>= print -- "Wed, 12PM"

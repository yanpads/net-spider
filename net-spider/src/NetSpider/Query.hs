-- |
-- Module: NetSpider.Query
-- Description: Query for snapshot graph
-- Maintainer: Toshio Ito <debug.ito@gmail.com>
--
-- 
module NetSpider.Query
       ( -- * Query type
         Query,
         defQuery,
         -- ** accessor functions
         startsFrom,
         unifyLinkSamples
       ) where

import NetSpider.Unify (LinkSampleUnifier, unifyToOne)

-- | Query for snapshot graph. You can get the default 'Query' by
-- 'defQuery' function, and customize its fields by the accessor
-- functions.
--
-- - Type @n@: node ID
-- - Type @na@: node attributes
-- - Type @fla@: attributes of found links.
-- - Type @sla@: attributes of snapshot links. Converted from @fla@ by
--   'unifyLinkSamples'.
data Query n na fla sla =
  Query
  { startsFrom :: [n],
    -- ^ Nodes from which the Spider starts traversing the history
    -- graph.
    unifyLinkSamples :: LinkSampleUnifier n na fla sla
    -- ^ See the document of 'LinkSampleUnifier'.
    --
    -- Default: 'unifyToOne'.
  }

-- | The default 'Query'.
defQuery :: Eq n
         => [n] -- ^ 'startsFrom' field.
         -> Query n na fla fla
defQuery ns = Query
              { startsFrom = ns,
                unifyLinkSamples = unifyToOne
              }


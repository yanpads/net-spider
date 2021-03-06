-- |
-- Module: NetSpider.Query.Internal
-- Description: 
-- Maintainer: Toshio Ito <debug.ito@gmail.com>
--
-- 
module NetSpider.Query.Internal
       ( FoundNodePolicy(..)
       ) where

-- | Policy to treat 'FoundNode's (local findings) when the spider
-- creates the snapshot graph.
--
-- @since 0.2.0.0
data FoundNodePolicy n na=
    PolicyOverwrite
  | PolicyAppend
  deriving (Show)


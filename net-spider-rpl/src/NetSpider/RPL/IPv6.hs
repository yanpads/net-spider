-- |
-- Module: NetSpider.RPL.IPv6
-- Description: 
-- Maintainer: Toshio Ito <debug.ito@gmail.com>
--
-- __This module is for internal use.__
module NetSpider.RPL.IPv6
  ( Prefix,
    InterfaceID,
    isLinkLocal,
    getPrefix,
    setPrefix
  ) where

import Data.Bits ((.&.))
import Data.Word (Word64)
import Net.IPv6 (IPv6(..), toWord16s)

type Prefix = Word64

type InterfaceID = Word64

isLinkLocal :: IPv6 -> Bool
isLinkLocal addr = (== 0xfe80) $ bitMask $ top_word
  where
    (top_word, _, _, _, _, _, _, _) = toWord16s addr
    bitMask w = w .&. (2 ^ (10 :: Int) - 1)

getPrefix :: IPv6 -> Prefix
getPrefix = ipv6A

setPrefix :: Prefix -> IPv6 -> IPv6
setPrefix p orig = orig { ipv6A = p }

module Calip.Types (IPv4, IPv6) where

import Data.Word (Word16, Word8)

data IPv4 = IPv4 Word8 Word8 Word8 Word8

instance Show IPv4 where
  show (IPv4 a b c d) = foldr f [] (unwords [a, b, c, d])
    where
      f char acc@(x : xs)
        | char == ' ' = [] : acc
        | otherwise = (char : x) : xs

data IPv6 = IPv6 Word16 Word16 Word16 Word16 Word16 Word16 Word16 Word16

instance Show IPv6 where
  show (IPv6 a b c d e f g h) = show a ++ '.' : show b ++ '.' : show c ++ '.' : show d

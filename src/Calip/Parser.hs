module Calip.Parser (parseIPv4, parseIPv6) where

import Calip.Types (IPv4, IPv6)

splitOn :: Char -> String -> [String]
splitOn delim = foldr f [[]]
  where
    f c acc@(x:xs)
      | c == delim = [] : acc
      | otherwise  = (c : x) : xs

parseIPv4 :: String -> Maybe IPv4
parseIPv4 ip = case splitOn '.' ip of
  [a,b,c,d] -> IPv4 <$>
  

parseIPv6 :: String -> Maybe IPv6
parseIPv6 ip =

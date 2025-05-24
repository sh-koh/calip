module Main where

import Calip
import Calip.Parser
import System.Environment (getArgs)
import System.Exit (ExitCode (ExitFailure, ExitSuccess), exitWith)

main :: IO ()
main = do
  args <- getArgs
  let parsed = case args of
        ("-4" : ip) -> parseIPv4 ip
        ("-6" : ip) -> parseIPv6 ip
        (arg : _) -> "invalid argument: " <> arg
  print parsed

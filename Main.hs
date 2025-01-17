{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.Data (Data)
import Data.FileEmbed (embedStringFile)
import Data.Text (pack, replace)
import Text.Printf (printf)

dockerFile :: String
dockerFile = $(embedStringFile "docker-compose.yml")

main :: IO ()
main = do
  writeFile "compose.yml" dockerFile

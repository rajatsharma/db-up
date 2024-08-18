{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.Text (pack, replace)
import FileEmbed (embedFile)
import Text.Printf (printf)

dockerFile :: String
dockerFile = $(embedFile "docker-compose.yml")

main :: IO ()
main = do
  writeFile "docker-compose.yml" dockerFile

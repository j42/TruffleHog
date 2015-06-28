module Paths_TruffleHog (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/j42/Code/TruffleHog/.cabal-sandbox/bin"
libdir     = "/Users/j42/Code/TruffleHog/.cabal-sandbox/lib/x86_64-osx-ghc-7.10.1/Truff_9SwMTvVpEl5EQrZ7BV2bCf"
datadir    = "/Users/j42/Code/TruffleHog/.cabal-sandbox/share/x86_64-osx-ghc-7.10.1/TruffleHog-0.1.0.0"
libexecdir = "/Users/j42/Code/TruffleHog/.cabal-sandbox/libexec"
sysconfdir = "/Users/j42/Code/TruffleHog/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TruffleHog_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TruffleHog_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "TruffleHog_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TruffleHog_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TruffleHog_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

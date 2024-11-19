{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Monadas (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/bin"
libdir     = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/lib/x86_64-linux-ghc-9.4.5/Monadas-0.1.0.0-39THneYmiLZBYuyMfVXCwL-Monadas"
dynlibdir  = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/lib/x86_64-linux-ghc-9.4.5"
datadir    = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/share/x86_64-linux-ghc-9.4.5/Monadas-0.1.0.0"
libexecdir = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/libexec/x86_64-linux-ghc-9.4.5/Monadas-0.1.0.0"
sysconfdir = "/home/guik/AulasP/Monadas/.stack-work/install/x86_64-linux/d69cee59889786c977d2122ebd001968bf9ba12d21b4d2ead110b672a78efeb0/9.4.5/etc"

getBinDir     = catchIO (getEnv "Monadas_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Monadas_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Monadas_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Monadas_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Monadas_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Monadas_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'

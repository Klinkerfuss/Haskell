{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_aulaDia21 (
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
bindir     = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/bin"
libdir     = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/lib/x86_64-linux-ghc-9.4.5/aulaDia21-0.1.0.0-5w73DmmBImu8YqtjZ3AZ9-aulaDia21"
dynlibdir  = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/lib/x86_64-linux-ghc-9.4.5"
datadir    = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/share/x86_64-linux-ghc-9.4.5/aulaDia21-0.1.0.0"
libexecdir = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/libexec/x86_64-linux-ghc-9.4.5/aulaDia21-0.1.0.0"
sysconfdir = "/home/guik/aulaDia21/.stack-work/install/x86_64-linux/6c549267875bebcf06df058b88a11f4a39505730fd7f53eed20907f7a42f07ab/9.4.5/etc"

getBinDir     = catchIO (getEnv "aulaDia21_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "aulaDia21_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "aulaDia21_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "aulaDia21_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aulaDia21_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aulaDia21_sysconfdir") (\_ -> return sysconfdir)




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

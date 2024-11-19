{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_aula0408 (
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
bindir     = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/bin"
libdir     = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/lib/x86_64-linux-ghc-9.4.5/aula0408-0.1.0.0-2Wid0UeEqPG3b5FTqonwTy-aula0408"
dynlibdir  = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/lib/x86_64-linux-ghc-9.4.5"
datadir    = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/share/x86_64-linux-ghc-9.4.5/aula0408-0.1.0.0"
libexecdir = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/libexec/x86_64-linux-ghc-9.4.5/aula0408-0.1.0.0"
sysconfdir = "/home/guik/AulasP/aula0408/.stack-work/install/x86_64-linux/1e1e6a8572d300aa29c4a9285e5f69fd2ae345ca95e347ead8f2ed8001334141/9.4.5/etc"

getBinDir     = catchIO (getEnv "aula0408_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "aula0408_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "aula0408_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "aula0408_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aula0408_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aula0408_sysconfdir") (\_ -> return sysconfdir)




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

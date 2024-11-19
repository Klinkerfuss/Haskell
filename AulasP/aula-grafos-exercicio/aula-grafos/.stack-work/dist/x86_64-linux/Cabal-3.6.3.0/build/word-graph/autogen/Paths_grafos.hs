{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_grafos (
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
bindir     = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/bin"
libdir     = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/lib/x86_64-linux-ghc-9.2.7/grafos-0.1.0.0-Kt9LNg5eIMQ4txy1jtFQOo-word-graph"
dynlibdir  = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/share/x86_64-linux-ghc-9.2.7/grafos-0.1.0.0"
libexecdir = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/libexec/x86_64-linux-ghc-9.2.7/grafos-0.1.0.0"
sysconfdir = "/home/guik/Downloads/aula-grafos-exercicio/aula-grafos/.stack-work/install/x86_64-linux/98fb530177e214f4a2975084f8a57e27dea3b9afade30712eb17f947a553219c/9.2.7/etc"

getBinDir     = catchIO (getEnv "grafos_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "grafos_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "grafos_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "grafos_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "grafos_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "grafos_sysconfdir") (\_ -> return sysconfdir)




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

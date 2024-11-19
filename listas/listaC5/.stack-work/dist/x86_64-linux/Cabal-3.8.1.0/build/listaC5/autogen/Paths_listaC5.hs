{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_listaC5 (
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
bindir     = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/bin"
libdir     = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/lib/x86_64-linux-ghc-9.4.6/listaC5-0.1.0.0-Kf2DzQPZ1bN68aLYtMaDkj-listaC5"
dynlibdir  = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/lib/x86_64-linux-ghc-9.4.6"
datadir    = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/share/x86_64-linux-ghc-9.4.6/listaC5-0.1.0.0"
libexecdir = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/libexec/x86_64-linux-ghc-9.4.6/listaC5-0.1.0.0"
sysconfdir = "/home/guik/Haskell/listas/listaC5/.stack-work/install/x86_64-linux/f1a61559d3ce7fc3a309285d2393686579813ecd71a723fa32bd3f374242f8fb/9.4.6/etc"

getBinDir     = catchIO (getEnv "listaC5_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "listaC5_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "listaC5_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "listaC5_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "listaC5_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "listaC5_sysconfdir") (\_ -> return sysconfdir)




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

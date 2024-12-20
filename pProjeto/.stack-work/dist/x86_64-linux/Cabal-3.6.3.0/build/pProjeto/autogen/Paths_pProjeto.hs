{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_pProjeto (
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
bindir     = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/bin"
libdir     = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/lib/x86_64-linux-ghc-9.2.7/pProjeto-0.1.0.0-E1BXcfNXoURIkSBwTLBui5-pProjeto"
dynlibdir  = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/share/x86_64-linux-ghc-9.2.7/pProjeto-0.1.0.0"
libexecdir = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/libexec/x86_64-linux-ghc-9.2.7/pProjeto-0.1.0.0"
sysconfdir = "/home/guik/pProjeto/.stack-work/install/x86_64-linux/d85cc3b1ecfed7c08236dcc1efae66442cbf914965b51fde8dd8e62488fe993f/9.2.7/etc"

getBinDir     = catchIO (getEnv "pProjeto_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "pProjeto_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "pProjeto_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "pProjeto_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pProjeto_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pProjeto_sysconfdir") (\_ -> return sysconfdir)




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

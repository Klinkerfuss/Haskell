module Main (main) where

data Expr = Lit Int
          | Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
    deriving Show

eval :: Expr -> (Int, String)
eval (Lit n) = (n, "")
eval (Add e1 e2) = (v1 + v2, l1 ++ "Add" ++ l2)
  where (v1, l1) = eval e1
        (v2, l2) = eval e2
eval (Sub e1 e2) = (v1 - v2, l1 )
  where (v1, l1) = eval e1
        (v2, l2) = eval e2

eval (Mul e1 e2) = ()

newtype Writer w a = Writer { runWriter :: (w, a)}

instance Monoid w => Functor (Writer w) where
  fmap :: (a -> b) -> Writer w a -> Writer w b
  fmap f (Writer (w, a)) = Writer (w, f a)

instance Monoid w => Applicative (Writer w) where
  pure :: a -> Writer w a
  pure a = Writer (mempty, a)

  (<*>) :: Writer w (a -> b) -> Writer w a -> Writer w b
  (Writer (w, ab)) <*> (Writer (w', a)) = Writer (w <> w', ab a)

instance Monoid w => Monad (Writer w) where
  return = pure
  (>>=) :: Writer w a -> (a -> Writer w b) -> Writer w b
  (Writer (w, a)) >>= awb = Writer (w <> w', b)
    where Writer (w', b) = awb a

meval :: Expr -> Writer String Int
meval (Lit n) = return n
meval (Add e1 e2) = meval e1          >>= \x -> 
                    Writer ("Add", x) >>= \n ->
                    meval e2          >>= \y ->
                    return $ x + y

meval (Lit n) = return n
meval (Sub e1 e2) = meval e1          >>= \x -> 
                    Writer ("Sub", x) >>= \n ->
                    meval e2          >>= \y ->
                    return $ x - y

main :: IO ()
main = do
  putStrLn "hello world"

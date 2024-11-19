module Main (main) where
import Prelude hiding (Ordering)
import GHC.Float (floatToDigits)
import GHC.Base (RuntimeRep(TupleRep))
import Data.Bits (Bits(xor))

main :: IO ()
main = do
  putStrLn "hello world"

data Nat = Zero | Succ Nat

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult _ Zero = Zero
mult (Succ m) n = add m (mult m n)

-- Exercicio 2
data Ordering = LT | EQ | GT


data Tree a = Leaf a | Node (Tree a) a (Tree a)
  deriving (Show)
{-
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf a) = x == a
occurs x (Node l n r) =
  case compre x n of
    EQ -> True
    LT -> occurs x l
    GT -> occurs x r
--    | compare x n == EQ = True
--    | compare x n == LT = occurs x l
--    | otherwise x n == GT = occurs x r


flatten :: Tree a -> [a]
flatten Leaf a = [a]
flatten Node l n r = flatten l : n : flatten r

data TreeB a = LeafB a | NodeB (TreeB a) (TreeB a)

nFolhas :: TreeB a -> Int
nFolhas LeafB a = 1
nFolhas Node l r = nFolhas l + nFolhas r

balanced :: TreeB a -> Bool
balanced Node l r = abs(nFolhas l - nFolhas r) <= 1


instance Functor TreeB where 
  fmap f (LeafB x) = LeafB (f x)
  fmap f (NodeB l x r) = NodeB (fmap f l) (fmap f r)


-- Ex 6
data Expr = Val Int | Add Expr Expr
folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f _ (Val x) = f x
folde f g (Add a b) = g (folde f g a) (folde f g b)

-- Ex 7
eval :: Expr -> Int
eval = folde (id) (+) 

size :: Expr -> Int
size = folde (const 1) (+)
-}
ys = [1,2,3]
test :: [Integer] -> [Integer]
test xs = foldl (\acc x->  x :acc ) ys xd


data Lista a = Elem a (Lista a)
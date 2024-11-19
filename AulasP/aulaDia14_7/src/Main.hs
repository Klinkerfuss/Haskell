module Main (main) where

import Test.QuickCheck

--Decide se todoso os valores l[ogicos de uma lista sao True
and2 :: [Bool] -> Bool
and2 []     = True
and2 (x:xs) = x && and2 xs

--Concatena uma lista de listas
concat2 :: [[a]] -> [a]
concat2 []       = []
concat2 (xs:xss) = xs ++ concat2 xss

--Produz uma lista com n valores identicos
replicate2 :: Int -> a -> [a]
replicate2 0 _ = []
replicate2 n x = x : replicate2 (n - 1) x

replicate3 n x = foldr (\_ acc -> x : acc) [] [1..n]

replicate4 n x = map (\_ -> x) [1..n]

replicate5 n x = map (const x) [1..n]

--- >>> replicate5 10 13
-- [13,13,13,13,13,13,13,13,13,13]

-- Seleciona o enesimo elemento de uma lista
(!!!) :: [a] -> Int -> a
[]     !!! _ = error "Lista vazia"
(x:_)  !!! 0 = x
(_:xs) !!! i = xs !!!  (i-1)

-- Verifica se um valor eh um elemento de uma lista
elem2 :: Eq a => a -> [a] -> Bool
elem2 _ [] = False
elem2 e (x:xs) = x == e || elem2 e xs

minimo :: Ord a => [a] -> a
minimo (x:xs) = minimo' x xs -- convensao chamar a funcao auxiliar como nome'
  where
    minimo' mi []     = []
    minimo' mi (y:ys)
      | mi <= y = minimo' mi ys
      | otherwise = minimo' y ys

minimo2 (x:xs) = foldr min x xs -- mesma coisa da funcao de cima

descarta :: Eq a => a -> [a] -> [a]
descarta e [] = []
descarta e (x:xs)
  | e == x = xs
  | otherwise = x : descarta e xs

selectionSort :: Ord a => [a] -> a
selectionSort [] = []
selectionSort [x] = [x]
selectionSort xs = 
  m : selectionSort (descarta m xs)
  where
    m = minimo xs

prop_tamanho :: Ord a => [a] -> Bool
prop_tamanho xs = length xs == length (selectionSort xs)

prop_ordem :: Ord a => [a] -> Bool
prop_ordem [] = True
prop_ordem [_] = True
prop_ordem ys = x0 <= x1 && prop_ordem (x1:xs)
  where 
  (x0:x1:xs) = selectionSort xs

prop_idempotencia :: Ord a => [a] -> Bool
prop_idempotencia xs =
  selectionSort xs == selectionSort (selectionSort xs)

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x <= y = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

quebra :: [a] -> ([a],[a])
quebra xs = quebra' xs [] []
  where
    quebra' [] zs ws = (zs, ws)
    quebra' (y:ys) zs ws = quebra' ys (y:ws) zs

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort pt1) (mergeSort pt2)
  where
    (pt1,pt2) = quebra xs

prop_merge_selection :: Ord a => [a] -> Bool
prop_merge_selection xs = 
  mergeSort xs == selectionSort xs

main :: IO ()
main = do
  quickCheck (prop_tamanho :: [Int] -> Bool)
  quickCheck (prop_ordem :: [String] -> Bool)
  quickCheck (prop_idempotencia :: [Char] -> Bool)

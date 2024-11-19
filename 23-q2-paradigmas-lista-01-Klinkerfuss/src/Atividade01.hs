module Atividade01
    ( mult3,
    mult8,
    mult83,
    ehPrimo,
    bissextos,
    lastNBissextos,
    stringToIntegers,
    ex8,
    subtrair,
    dobro,
    quad,
    aniversario,
    cumprimentar
    ) where
import Data.Char (digitToInt)

{-Exercício 01: Faça uma função {mult3 n} que retorne True caso a entrada seja múltiplo de 3 e False caso contrário.-}
mult3 :: (Eq x, Num x, Integral x) => x -> Bool
mult3 x = rem x 3 == 0

{-Exercício 02: Faça uma função {mult8 n} que retorne True caso a entrada seja múltiplo de 8 e False caso contrário.-}
mult8 :: (Eq x, Num x, Integral x) => x -> Bool
mult8 x = rem x 8 == 0

{-Exercício 03: Faça uma função {mult83 x} que retorne True caso a entrada seja múltiplo de 3 e 8 e False caso contrário.-}
mult83 :: (Eq x, Num x, Integral x) => x -> Bool
mult83 x = rem x 8 == 0 && rem x 3 == 0

{-Exercício 04: Faça uma função {ehPrimo n} que determina se um número é primo..-}
ehPrimo :: Integral a => a -> Bool
ehPrimo x = [1,x] == [y | y <-[1..x], mod x y == 0]

{-Exercício 05: Faça uma função {bissextos} que retorne todos os anos bissextos até 2020, começando pelo ano 1584.-}
bissextos :: [Integer]
bissextos = [x | x <- [1584..2020], (rem x 4 == 0 && rem x 100 /= 0) || (rem x 400 == 0 && rem x 100 == 0)] 

{-Exercício 06: Faça uma função {lastNBissextos n} que encontre os N últimos anos bissextos.-}
lastNBissextos :: Int -> [Integer]
lastNBissextos x = drop (length bissextos - x)  bissextos

{-Exercício 7: Faça uma função {stringToIntegers s} que recebe uma string s contendo somente números (e.g. ``01234") e devolva uma lista com os dígitos em formato Integer.-}
stringToIntegers :: String -> [Integer]
stringToIntegers s = [ toInteger (digitToInt x) | x <- s]

{-Exercício 08: Faça uma funcao {ex8 x}  retorne True caso a entrada seja maior que -1 E (menor que 300 OU múltiplo de 6), e False caso contrário.-}
ex8 :: (Eq x, Num x, Integral x) => x -> Bool
ex8 x = x > -1 && (x<300 || rem x 6 == 0)

{-Exercício 10:-}
subtrair :: Int -> Int -> Int
subtrair a b = a - b

dobro :: Int -> Int
dobro a = a * 2

quad :: Int  -> Int
quad a = a * a

cumprimentar :: [Char] -> [Char]
cumprimentar nome = "Olá " ++ nome

aniversario :: Int -> [Char]
aniversario ano = "Você fará " ++ show(2023 - ano) ++ " anos em 2023!"

module Main (main) where
import Data.List (nub)

data Prop = Const Bool -- constante
    | Var Char -- variável
    | Not Prop -- Não
    | And Prop Prop -- E
    | Imply Prop Prop -- Se-Então

type Subst = Assoc Char Bool

type Assoc k v = [(k,v)]
find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k == k']

-- retorna o resultado ao substituir as variáveis de uma proposição por valores boo-- crie um pattern matching para cada possível valor de Prop
avalia :: Subst -> Prop -> Bool
avalia _ (Const b)     = b
avalia s (Var c)       = find c s
avalia s (Not p)       = not $ avalia s p
avalia s (And pr0 pr1) = avalia s pr0 && avalia s pr1
avalia s (Imply a b)   = not(avalia s a && not (avalia s b))

vars :: Prop -> [Char]
vars (Const _)       = []
vars (Var c)         = [c]
vars (Not p)         = vars p
vars (And pr0 pr1)   = vars pr0 ++ vars pr1
vars (Imply pr0 pr1) = vars pr0 ++ vars pr1


-- remove as variáveis duplicadas da lista
uniquevars :: Prop -> [Char]
uniquevars   = nub . vars
--uniquevars p = nub (vars p)
--uniquevars   = \p -> nub (vars p)
--uniquevars p = nub . vars $ p

bools :: Int -> [[Bool]]
bools 1 = [[False], [True]]
bools n = map (False :) bools' ++ map (True :) bools'
--(False :) aplicacao implicita de (\bs -> False : bs) adiciona False na cabeca e faz cons com o resto
  where
    bools' = bools (n - 1)

-- Exemplo: substs (Var 'A') `And` (Var 'B') deve gerar
-- [[('A', False), ('B', False)], [('A', False), ('B', True)],
-- [('A', True), ('B', False)], [('A', True), ('B', True)]]
substs :: Prop -> [Subst]
substs p =
  map (zip vs) bs
  where
    vs = uniquevars p
    bs = bools $ length vs


p1 :: Prop
p1 = (Var 'A') `And` (Not (Var 'A'))
p2 :: Prop
p2 = ((Var 'A') `And` (Var 'B')) `Imply` (Var 'A')
p3 :: Prop
p3 = (Var 'A') `Imply` ((Var 'A') `And` (Var 'B'))
p4 :: Prop
p4 = ((Var 'A') `And` ((Var 'A') `Imply` (Var 'B'))) `Imply` (Var 'B')

isTaut :: Prop -> Bool --Tautologia eh um funcao que avalia todas as substituicoes possiveis e retorna verdadeiro
--isTaut p = and $ map (`avalia` p) ss -- and no comeco verifica se todos os elementos de uma lista sao verdadeiros
isTaut p = all (`avalia` p) ss -- all eh a mesma coisa que escrever um And de um Map
-- (flip avalia $ p)ss -> flip: dado uma funcao retorna a mesma funcao com os paramentros trocados  
  where
    ss = substs p


main :: IO ()
main = do
  print $ isTaut p1
  print $ isTaut p2
  print $ isTaut p3
  print $ isTaut p4
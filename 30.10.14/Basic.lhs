
\begin{code}
module Basic where
\end{code}

factorial: 
----------

* product definition 

  n! = 1 * 2 * ... * n

* recursive definition 

  n! = 1          , if n = 0
  n! = (n-1)! * n , if n > 0


\begin{code}
fact n = if n == 0 then 1 else fact (n-1) * n
\end{code}

Alternative Syntax ...

\begin{code}
fact' 0 =  1
fact' n = fact' (n-1) * n
\end{code}


Another Syntax ...

\begin{code}
fact'' n 
  | n == 0    =  1
  | otherwise = fact' (n-1) * n
\end{code}


What is the type of fac?

fact :: Int     -> Int   
fact :: Double  -> Double
fact :: Real    -> Real
....


The type of `fact` can be `a -> a` for *any* type `a` that supports

* equality       (==)
* minus          (-)
* multiplication (*)


fact :: (Num a, Eq a) => a -> a



Data Types
==========

If the argument is negative (n < 0) factorial is not defined.
Build a data structure (`ErrInt`) that tags the result of factorial as

* Error n (for negative `n`s)
* Value n (for the real result)


Note: When you want to use the result of the factorial you need to case analyse
to distinguish if it is an Error or a Value:

\begin{code}
fact''' n 
  | n == 0    = Value 1
  | n >  0    = case fact''' (n-1) of 
  	            Value m -> Value $ n * m
  	            Error m -> Error m
  | otherwise = Error n


data ErrInt a = Error a | Value a
\end{code}

What is that dollar? (`$`)
---------------------------

It is a "silly" function commonly used in Haskell to avoid parenthesis. 
When you see `f $ e` you can replace it with parenthesyzing the right part of dollar: `f (e)`
Dollar is defined as:

\begin{code}
infixr 0 $$ 
f $$ x = f x
\end{code}



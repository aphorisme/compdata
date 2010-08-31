--------------------------------------------------------------------------------
-- |
-- Module      :  Data.ALaCarte.Derive
-- Copyright   :  3gERP, 2010
-- License     :  AllRightsReserved
-- Maintainer  :  Tom Hvitved, Patrick Bahr, and Morten Ib Nielsen
-- Stability   :  unknown
-- Portability :  unknown
--
--
--------------------------------------------------------------------------------

module Data.ALaCarte.Derive (
  module Data.ALaCarte.Derive.Show,
  module Data.ALaCarte.Derive.Ordering,
  module Data.ALaCarte.Derive.Equality,
  module Data.ALaCarte.Derive.Arbitrary,
  module Data.ALaCarte.Derive.SmartConstructors,
  instanceFunctor,
  instanceFoldable,
  instanceTraversable,
  derive ) where

import Data.ALaCarte.Derive.Show
import Data.ALaCarte.Derive.Ordering
import Data.ALaCarte.Derive.Equality
import Data.ALaCarte.Derive.Arbitrary
import Data.ALaCarte.Derive.SmartConstructors

import Language.Haskell.TH
import Control.Monad

import qualified Data.DeriveTH as D
import Data.Derive.All

derive :: [Name -> Q [Dec]] -> [Name] -> Q [Dec]
derive ders names = liftM concat $ sequence [der name | der <- ders, name <- names]

instanceFunctor :: Name -> Q [Dec]
instanceFunctor = D.derive makeFunctor

instanceFoldable :: Name -> Q [Dec]
instanceFoldable = D.derive makeFoldable

instanceTraversable :: Name -> Q [Dec]
instanceTraversable = D.derive makeTraversable
module Test.Std where

import Prelude
import Effect (Effect)
import Data.Either (Either(..))
import Effect.Class (liftEffect)

import Test.Spec (it, describe, Spec)
import Test.Spec.Assertions (shouldEqual)

import Simmer.Interpret as I
import Simmer.Std as Std
import Simmer.Std.Tags (voidTag)

suite :: Spec Unit
suite = describe "Std functionality tests" do
    simpleTests

eval :: String -> Effect (Either String I.Value)
eval = I.eval' [ Std.library ]

simpleTests :: Spec Unit
simpleTests = describe "Simple eval stuff" do
    it "Test log string" do
       result <- liftEffect $ eval "log \"foo\""
       result `shouldEqual` Right (I.TagVal voidTag)
    it "Test log num" do
       result <- liftEffect $ eval "log 123"
       result `shouldEqual` Right (I.TagVal voidTag)
    it "Test add smoke" do
       result <- liftEffect $ eval "2 + 3"
       result `shouldEqual` Right (I.NumberVal 5.0)
    it "Test multiply smoke" do
       result <- liftEffect $ eval "2 * 3"
       result `shouldEqual` Right (I.NumberVal 6.0)

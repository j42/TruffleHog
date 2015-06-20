-- Identify Transcodes

import qualified Sound.File.Sndfile as Snd
import qualified Sound.File.SndFile.Buffer.StorableVector as BV
import qualified Data.StorableVector as V

import Array as A
import Complex
import DSP.Basic
import Numeric.Transform.Fourier.FFT
import System.Environment


main :: IO ()
main = do
    getArgs >>= print
    getProgName >>= print
    getEnvironment >>= print

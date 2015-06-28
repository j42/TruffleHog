-- Identify Transcodes

module Main where

import qualified Sound.File.Sndfile as SF
import qualified Sound.File.Sndfile.Buffer.StorableVector as BV
import qualified Data.StorableVector as SV

import Debug.Trace
import Data.Array as A
import Data.Complex
import System.Environment
import DSP.Window
import Numeric.Transform.Fourier.FFT
--import Data.Complex as Complex
--import DSP.Basic
--import System.Environment


main :: IO ()
main = do

    -- Interpret Arguments
    args <- getArgs
    let file = case args of []  -> "./test/audio/sup.wav"
                            [x] -> head args
                            xs  -> head args

    -- Import Wave File
    (rawFileData) <- readRawWaveFile file

    -- Get Hanning Window
    let window  = getHanningWindow rawFileData
        --samples = fourierTransform window

    print window



-- Read WAV File to Buffer
readRawWaveFile :: String -> IO (SV.Vector Double)
readRawWaveFile path = do

     -- Read File
    file <- SF.openFile path SF.ReadMode SF.defaultInfo

    -- Get File Info
    (info, Just buf) <- SF.hGetContents file :: IO (SF.Info, Maybe (BV.Buffer Double))

    -- Return Buffer
    return (BV.fromBuffer buf)



-- Get Array from Vector
arrayFromVector :: SV.Vector Double -> A.Array Int Double
arrayFromVector vector =
    let l = SV.length vector - 1 in
        array (0,l) (zip [0..l] (SV.unpack vector))



-- Get Hanning Window from Vectors
getHanningWindow :: SV.Vector Double -> A.Array Int Double
getHanningWindow vectors =
    let signal  = arrayFromVector vectors
        count   = min (length signal - 1) 1323000
        win     = hanning count
    in
        window win signal


-- Apply Fast-Fourier-Transform
-- fourierTransform :: A.Array Int Double -> Array a (Complex b)
-- fourierTransform window =
--    fft window

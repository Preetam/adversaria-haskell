import Data.Map
import Data.List
import System.Environment
import System.IO
import System.Directory
import Data.Binary as Binary
import Text.JSON as JSON

dispatch :: [(String, [String] -> IO ())]
dispatch = [ ("set", Main.set)
           , ("get", Main.get)
           , ("init", Main.init)
           , ("print", Main.print)
           ]

main = do
	(command:args) <- getArgs
	let (Just action) = Data.List.lookup command dispatch
	action args

set [file, key, val] = do
	let m = readDBFromFile file
	tmp <- m
	let tmp2 = Data.Map.insert (read key :: Integer) (read val :: Float) tmp
	Binary.encodeFile (file++".tmp") tmp2
	removeFile file
	renameFile (file++".tmp") file

init :: [String] -> IO ()
init [file] = do
	let tmp = Data.Map.empty
	Binary.encodeFile (file :: String) (tmp :: Map Integer Float)
	putStr "init"

get file = putStr "get"

print [file] = do
	let m = readDBFromFile file
	tmp <- m
	putStr (JSON.encode tmp)

readDBFromFile :: String -> IO (Map Integer Float)
readDBFromFile file = Binary.decodeFile file

module Main where

data DecisionTree a  = Answer a
                     | Question a (DecisionTree a) (DecisionTree a)
                     deriving (Eq, Ord, Show, Read)

traverseDecisionTree tree =
    case tree of
      Answer answer -> putStrLn answer
      Question question yesPath noPath -> do
          putStrLn question
          input <- getLine
          case input of
            "Y" -> traverseDecisionTree yesPath
            "N" -> traverseDecisionTree noPath
            _ -> putStrLn "Invalid input"

main :: IO ()
main = do
    let cleanTerminalsAnswer = Answer "Clean terminals and try starting again"
    let replaceCablesAnswer = Answer "Replace cables and try again"
    let replaceBatteryAnswer = Answer "Replace the battery"
    let checkSparkPlugAnswer = Answer "Check spark plug connections"
    let checkChokeAnswer = Answer "Check to ensure the choke is opening and closing"
    let serviceAnswer = Answer "Get it in for service"
    let newVehicleAnswer = Answer "Time for a new vehicle"
    let fuelInjectionQuestion = Question "Does your car have fuel injection?" checkChokeAnswer serviceAnswer
    let engineStartAndDieQuestion = Question "Does your engine start and then die?" fuelInjectionQuestion newVehicleAnswer
    let crankButFailStartQuestion = Question "Does your car crank up but fail to start?" checkSparkPlugAnswer engineStartAndDieQuestion
    let carClickingNoiseQuestion = Question "Does the car  make a clicking noise?" replaceBatteryAnswer crankButFailStartQuestion
    let batteryTerminalsCorrodedQuestion = Question "Are the battery terminals corroded?" cleanTerminalsAnswer replaceCablesAnswer
    let carSilentDuringKeyturnQuestion = Question "Is the car silent when you turn the key?" batteryTerminalsCorrodedQuestion carClickingNoiseQuestion
    putStrLn "Answer Y to indicate yes or N to indicate no"
    traverseDecisionTree carSilentDuringKeyturnQuestion

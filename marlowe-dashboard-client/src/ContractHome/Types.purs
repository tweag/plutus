module ContractHome.Types where

import Prelude
import Analytics (class IsEvent, defaultEvent)
import Contract.Types (ContractId)
import Contract.Types (State) as Contract
import Data.Map (Map)
import Data.Maybe (Maybe(..))
import Marlowe.Semantics (Slot)

data ContractStatus
  = Running
  | Completed

derive instance eqContractStatus :: Eq ContractStatus

type State
  = { status :: ContractStatus
    -- FIXME: We are currently using an Array for holding all the contracts and a
    --        Maybe Int for seeing which one is selected. Eventually, this would probably
    --        be a `Map ContractId Contract.State` and a `Maybe ContractId`. We need to see how
    --        we identify contracts between the FE and BE and also if the performance hit of having
    --        to split the map between running and completed is worth not having state duplication
    --        (Two arrays and a Map).
    --        Also, we should check if this data belongs here or in PlayState
    , contracts :: Map ContractId Contract.State
    , selectedContractIndex :: Maybe ContractId
    }

type PartitionedContracts
  = { completed :: Array Contract.State, running :: Array Contract.State }

data Action
  = OpenTemplateLibraryCard
  | SelectView ContractStatus
  | OpenContract ContractId
  | AdvanceTimedOutContracts Slot

instance actionIsEvent :: IsEvent Action where
  toEvent OpenTemplateLibraryCard = Just $ defaultEvent "OpenTemplateLibraryCard"
  toEvent (SelectView _) = Just $ defaultEvent "SelectView"
  toEvent (OpenContract _) = Just $ defaultEvent "OpenContract"
  toEvent (AdvanceTimedOutContracts _) = Nothing

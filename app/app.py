from fastapi import FastAPI, Request
from .lab_state import LabState
from pydantic import BaseModel


class StateModel(BaseModel):
    state: bool | None = None
    


app = FastAPI()


@app.post("/change_state", response_model=StateModel, status_code=200)
async def change_state(request: Request, state: StateModel):
    if state.state:
        new_state = await LabState.change_status(state.state)
    else:
        new_state = await LabState.change_status()
    return StateModel(state = new_state)

@app.get("/state")
async def get_state(request: Request):
    status = await LabState.get_status()
    return StateModel(state = status)
import os
import logging
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from openai import OpenAI

log = logging.getLogger("uvicorn.error")

class ChatReq(BaseModel):
    messages: list
    model: str = "gpt-4o-mini"
    temperature: float = 0.2

app = FastAPI()
client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

@app.get("/health")
def health():
    return {"ok": True}

@app.post("/chat")
def chat(req: ChatReq):
    try:
        log.info("chat request: %s", req.model)
        r = client.chat.completions.create(
            model=req.model, messages=req.messages, temperature=req.temperature
        )
        txt = r.choices[0].message.content
        return {"text": txt}
    except Exception as e:
        log.exception("chat error")
        raise HTTPException(status_code=500, detail=str(e))

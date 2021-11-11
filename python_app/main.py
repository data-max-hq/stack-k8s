import logging
import sys

from fastapi import FastAPI, status
from fastapi.responses import JSONResponse


def setup_logging():
    """
    initialize logger
    """

    logformat = "[%(asctime)s] %(levelname)s:%(name)s:%(message)s"
    loglevel = logging.INFO
    logging.basicConfig(
        level=loglevel, stream=sys.stdout, format=logformat, datefmt="%Y-%m-%d %H:%M:%S"
    )


app = FastAPI()
setup_logging()


@app.get("/health")
def health_check():
    logging.info("Got Request.")
    return JSONResponse(status_code=status.HTTP_200_OK, content={"heath": "healthy"})


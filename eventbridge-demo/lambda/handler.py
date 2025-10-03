import json
import os
import time
from datetime import datetime, timezone

def lambda_handler(event, context):
    """
    Minimal handler to prove the wiring works.
    Extend with idempotency (DynamoDB conditional writes),
    structured logging, and tracing as needed.
    """
    # Basic structured log
    log = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "function": context.function_name if context else "local",
        "request_id": getattr(context, "aws_request_id", "local"),
        "event": event,
    }
    print(json.dumps(log, separators=(",", ":")))

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"ok": True, "ts": time.time()}),
    }

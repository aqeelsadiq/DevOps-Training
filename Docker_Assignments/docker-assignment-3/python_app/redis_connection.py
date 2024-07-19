import redis

# Redis connection details
redis_host = 'redis'  # Service name defined in Docker Compose
redis_port = 6379

try:
    # Create a Redis connection
    client = redis.StrictRedis(host=redis_host, port=redis_port, decode_responses=True)
    
    # Test the connection
    response = client.ping()
    if response:
        print("Successfully connected to Redis!")
    else:
        print("Failed to connect to Redis.")
except redis.ConnectionError as e:
    print(f"Connection error: {e}")

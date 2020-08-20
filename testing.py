
from dotenv import load_dotenv
from pathlib import Path
import os
env = Path('.') / '.env'
load_dotenv(dotenv_path=env)
os.getenv('nitish')

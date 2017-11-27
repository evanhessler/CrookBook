# CrookBook
LAPD Case Tracking Management System

## Developement Installation

### Building With docker-compose
#### Requirements:
1. git
2. docker
3. docker-compose
4. pip-tools

#### Steps:
1. Ensure docker and docker-compose are installed and working.
2. Run `docker-compose build` to create the needed images.
3. Run `docker-compose up` to run the images as containers.
4. Ctrl+c to stop server.

#### Additional docker-compose Commands:
- `docker-compose run makemigrations` detects new database migrations.
- `docker-compose run migrate` runs above command and makes the migrations.
- `docker-compose run manage` serves as an entry-point for additional Django manage.py commands.
- `docker-compose run manage createsuperuser` will prompt for username/password and then create a root user.

### Building Manually
#### Requirements:
1. git
2. python3
3. virtualenv
4. pip-tools
5. docker
6. docker-compose

#### Steps:
1. `git clone <url>`
2. Move into project directory, then create virtual environment: `virtualenv --python=python3 venv`
3. Activate virtual environment: `source venv/bin/activate`
4. Install requirements: `pip install -r requirements.txt`

## Contributing
TODO

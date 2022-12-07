Database Test Generator
=======================

This project contains a python script that inspects a PostgreSQL-compliant database with a randomly generated schema and generates functional tests for it. The tests cover the SELECT, UPDATE, DELETE, and INSERT statements and test various language functions, operators, and data types.

Requirements
------------

- Docker

Running the Script
------------------

1. Clone this repository:

```sh
git clone https://github.com/<your-username>/database-test-generator.git
```

2. Navigate to the directory containing the cloned repository:

```sh
cd database-test-generator
```

3. Start the python and PostgreSQL services using Docker Compose:

```sh
docker-compose up
```

This will start the python and postgres services and run the test_generator.py script against the PostgreSQL database. The tests will be printed to the terminal.

4. To stop the services, press CTRL+C in the terminal.

License
-------

This project is licensed under the MIT License. See LICENSE for details.

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


Media
-----

Here are some screenshots of the conversation used to generate this project:

![step 2](./media/2.png "step 2")
![step 3](./media/3.png "step 3")
![step 4](./media/4.png "step 4")
![step 5](./media/5.png "step 5")
![step 6](./media/6.png "step 6")
![step 7](./media/7.png "step 7")
![step 8](./media/8.png "step 8")
![step 9](./media/9.png "step 9")
![step 10](./media/10.png "step 10")
![step 11](./media/11.png "step 11")
![step 12](./media/12.png "step 12")
![step 13](./media/13.png "step 13")
![step 14](./media/14.png "step 14")
![step 15](./media/15.png "step 15")
![step 16](./media/16.png "step 16")

# 42-Inception

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Installation and Setup](#installation-and-setup)
- [Usage](#usage)
- [Features](#features)
- [Technical Details](#technical-details)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

42-Inception is a project designed to broaden your understanding of system administration by using Docker. You will create and manage your own multi-service setup, turning your system into a virtualized environment by building, configuring, and running Docker containers. This project focuses on good practices in system administration, Docker concepts, and container orchestration.

## Project Structure

- **Makefile**: Automates setup, configuration, and other project tasks.
- **srcs/**: The main source directory containing:
  - **docker-compose.yml**: Configuration file for managing the containers.
  - **Dockerfiles/**: Contains individual Dockerfiles for each service.
  - **configs/**: Stores configuration files for NGINX, MariaDB, WordPress, and other services.
- **data/**: Persistent data storage for volumes.

## Installation and Setup

### Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

### Steps to Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/mehdisalim/42-Inception.git
    ```
2. Navigate to the project directory:
    ```bash
    cd 42-Inception
    ```
3. Build and start the containers:
    ```bash
    make up
    ```
4. To stop the containers:
    ```bash
    make down
    ```

## Usage

Once the containers are running, the services like WordPress, MariaDB, and NGINX are ready for use. You can access the WordPress site through your browser at `http://localhost`, with configurations as defined in the `docker-compose.yml`.

## Features

- Multi-container Docker environment using Docker Compose.
- Includes NGINX as a reverse proxy, MariaDB as a database, and WordPress for a CMS.
- Configurable and extendable architecture.
- Practices good security and deployment principles.
  
## Technical Details

The project involves setting up a LEMP (Linux, NGINX, MySQL/MariaDB, PHP) stack with Docker containers:

- **NGINX**: Acts as a web server and reverse proxy.
- **MariaDB**: Handles database management.
- **WordPress**: Provides the content management system.
- **Docker Compose**: Orchestrates all the services and manages container interactions.

## Troubleshooting

- **Common Issues**: If services fail to start, ensure Docker is running and that there are no conflicting ports.
- **Log Access**: Use `docker-compose logs` to view service logs for debugging.
- **Container Management**: Control individual services using `docker-compose up <service>` and `docker-compose down <service>`.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

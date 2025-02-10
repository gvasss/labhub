# LabHub - Laboratory Management System

LabHub is a comprehensive laboratory management system built with Ruby on Rails. It allows users to manage laboratory resources, track experiments, and organize research data efficiently.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Lab Resource Management**: Keep track of lab equipment and materials.
- **Experiment Tracking**: Log and monitor ongoing research experiments.
- **User Authentication**: Secure login and role-based access control.
- **Data Organization**: Efficiently store and retrieve research data.
- **RESTful API**: Designed to integrate seamlessly with external applications.
- **Docker Support**: Includes Dockerfile for easy deployment.

## Requirements

- Ruby (version specified in `.ruby-version`)
- Bundler (`gem install bundler`)
- PostgreSQL or SQLite (depending on configuration)
- Docker (optional for containerized deployment)

## Installation

### Local Setup

1. Clone this repository:

    ```bash
    git clone https://github.com/gvasss/labhub.git
    cd labhub-main
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create db:migrate
    ```

4. Start the Rails server:

    ```bash
    rails server
    ```

### Docker Setup (Optional)

1. Build and run the Docker container:

    ```bash
    docker-compose up --build
    ```

## Usage

- Access the system at `http://localhost:3000`.
- Use API endpoints to manage lab resources and experiments.
- Integrate with external tools for data analysis.

## Contributing

Contributions are welcome! Feel free to fork the repository, create a feature branch, and submit pull requests.

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


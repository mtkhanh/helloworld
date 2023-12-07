# Use a base image with CMake and a C++ compiler (e.g., Ubuntu with g++)
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    lcov \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source code
COPY . /app

# Build the project
RUN cmake -Bbuild -H. && cmake --build build --target all

# Run tests
RUN cd build && ctest

# Generate code coverage report
RUN cd build \
    && lcov --directory . --capture --output-file coverage.info \
    && lcov --remove coverage.info '/usr/*' --remove coverage.info '/app/libs/*' --output-file coverage.info \
    && lcov --list coverage.info

# Command to print the coverage report when the container is run
ENTRYPOINT ["sh", "-c", "cd build && lcov --list coverage.info"]
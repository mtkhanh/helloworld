# Use a base image with CMake and GCC installed
FROM gcc:latest

# Set working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install necessary packages for code coverage (gcovr, lcov)
RUN apt-get update && apt-get install -y cmake gcovr lcov

# Compile the project using CMake
RUN cmake -Bbuild -H. && cmake --build build --target all


# Run the unit tests
WORKDIR /build/
RUN ctest

# Generate code coverage report
WORKDIR /
RUN cmake --build build --target coverage

# # Expose the coverage report
# EXPOSE 80

# # Command to start a simple HTTP server to serve the coverage report
# CMD python3 -m http.server 80 --directory build/coverage/

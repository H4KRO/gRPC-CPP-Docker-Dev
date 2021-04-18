# Docker for C++ GRPC development

Easy to use Debian stretch based C++ gRPC Docker image.

Build, start and go into with VSCode (Remote-Container module needed).

## Build

<code>
docker build -t iotenv:latest .

docker run --rm -d -t --name iotenv iotenv:latest
</code>

## Example

Clone https://github.com/npclaudiu/grpc-cpp-docker, create build/local, then :

### Build and run

<code>
CMake ../..

make -j8 all

./calculator
</code>

CMake complete development base repo coming soon.

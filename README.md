# Docker for C++ GRPC development

Easy to use Debian stretch based C++ gRPC Docker image.

Build, start and go into with VSCode (Remote-Container module needed).

## Build
<code>
docker build -t iotenv:beta .
docker run iotenv
</code>

## Example

Clone https://github.com/H4KRO/gRPC-CPP-Docker-Dev, create build/local, then :

### Build and run
<code>
CMake ../..
make -j8 all
./calculator
</code>

CMake complete development base repo coming soon.

#!/bin/bash

conan create conanfile.py grpc/1.43.0@aurorasolar/release
conan upload grpc/1.43.0@aurorasolar/release -r aurorasolar

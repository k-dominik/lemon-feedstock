mkdir build
cd build

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_POSITION_INDEPENDENT_CODE=1 ^
    -DBUILD_SHARED_LIBS=1 ^
    ..

cmake --build . --config Release

cmake --build . --config Release --target error_test
cmake --build . --config Release --target bfs_test

ctest -R error_test
ctest -R bfs_test

cmake --build . --config Release --target install

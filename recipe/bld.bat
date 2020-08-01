mkdir build
cd build

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_POSITION_INDEPENDENT_CODE=1 ^
    -DBUILD_SHARED_LIBS=1 ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=1 ^
    ..

if errorlevel 1 exit 1

cmake --build . --config Release

if errorlevel 1 exit 1

cmake --build . --config Release --target error_test
if errorlevel 1 exit 1
cmake --build . --config Release --target bfs_test
if errorlevel 1 exit 1

ctest -R error_test
if errorlevel 1 exit 1
ctest -R bfs_test
if errorlevel 1 exit 1

cmake --build . --config Release --target install

if errorlevel 1 exit 1

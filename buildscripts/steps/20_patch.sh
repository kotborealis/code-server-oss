#!/bin/sh

set -ex

# Prevent electron build and builtin extension downloads
if [ -f build/lib/preLaunch.ts ]; then
    sed -i -e '/getElectron()/d' -e '/getBuiltInExtensions/d' build/lib/preLaunch.ts
elif [ -f build/lib/preLaunch.js ]; then
    sed -i -e '/getElectron()/d' -e '/getBuiltInExtensions/d' build/lib/preLaunch.js
fi

# Avoid mangling in server build (mangler can fail on main)
if [ -f build/gulpfile.reh.ts ]; then
    sed -i -e 's/compileBuildWithManglingTask/compileBuildWithoutManglingTask/g' build/gulpfile.reh.ts
fi

# Reduce transpile worker count to lower memory usage during build
if [ -f build/lib/tsb/transpiler.ts ]; then
    sed -i -e 's/static P =.*/static P = 1;/' build/lib/tsb/transpiler.ts
fi

# Prevent builtin extensions from downloading
cat product.json
node -e 'console.log(JSON.stringify({...require("./product.json"), builtInExtensions: []}))' > product.json.tmp
mv product.json.tmp product.json

# TODO after restart

## Goal
Build VS Code Server from `main` with more headroom and verify the image builds end-to-end.

## Steps
1. Increase VM/container memory (recommend 8–12 GB) and CPU if possible.
2. Re-run the build:
   `docker-compose build`
3. If the build still terminates during `compile-src`:
   - Increase memory further or run the build on a beefier host.
   - Consider running the build outside Docker to rule out container limits.

## Notes on current changes
- Base image updated to `node:22-bookworm`.
- Build now uses `npm ci` instead of `yarn`.
- Ripgrep is pre-cached to avoid GitHub API rate limits during install.
- Mangling disabled for `reh` build (avoids build failure on `main`).
- Transpile worker count reduced to lower memory usage.
- Sourcemaps disabled via `VSCODE_NO_SOURCEMAP=1`.
- Build target is `vscode-reh-web-linux-x64` (non-minified).

## If successful
- Verify image runs: `docker-compose up code-server`
- Confirm output assets are present under `/code-server-oss` in the image.

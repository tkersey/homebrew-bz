# homebrew-bz

Homebrew tap for `bz`.

```sh
brew install tkersey/tap/bz
```

## Release Checklist (Tap Maintainers)

1. Require a signed upstream tag before any formula bump.
   - Set the target tag: `TAG=vX.Y.Z`.
   - Refresh tags: `git -C ../bz fetch --tags --force`.
   - Verify signature: `git -C ../bz tag -v "$TAG"`.
   - Continue only when verification reports a good signature for the release tag.
2. Update `Formula/bz.rb` source fields exactly.
   - Build release tarball URL: `URL="https://github.com/tkersey/bz/archive/refs/tags/${TAG}.tar.gz"`.
   - Compute checksum: `SHA256="$(curl -fsSL "$URL" | shasum -a 256 | awk '{print $1}')"`.
   - Update formula fields:
     - `url "$URL"`
     - `sha256 "$SHA256"`
3. Validate the bump.
   - `brew uninstall --force bz || true`
   - `brew install --build-from-source ./Formula/bz.rb`
   - `brew test bz`
4. Breakage policy.
   - If formula install/test compatibility breaks, fix formula compatibility first.
   - Do not start or continue feature work until compatibility is restored.

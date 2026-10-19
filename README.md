# Docker Bake multi-architecture example

This repository demonstrates a small Docker Buildx Bake setup with two images.

The `default` group builds both images for:

- `linux/amd64`
- `linux/arm64`

Each Dockerfile accepts a `MESSAGE` build argument and writes it to
`/message.txt`, making the build-argument behavior easy to inspect.

Run the group locally with:

```sh
docker buildx bake
```

The GitHub Actions workflow runs the same group on pushes, pull requests, and
manual workflow dispatches. It uses a matrix of native GitHub-hosted runners:

- `ubuntu-24.04` for `linux/amd64`
- `ubuntu-24.04-arm` for `linux/arm64`

Each job builds both images for its runner's native architecture. The workflow
does not push them.

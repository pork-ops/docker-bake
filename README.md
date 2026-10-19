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
manual workflow dispatches. It builds the images but does not push them.

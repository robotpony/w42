# /image-add

Add one or more images (photos or screenshots) to a blog post.

Usage: /image-add <image path(s)> <post title or file>

1. **Find the post.** Match by `title` in frontmatter, then by filename, under `content/`. If more than one post matches, or none, ask. Don't guess.
2. **Make sure it's a page bundle.** Images live next to the post's `index.md` (e.g. `content/blog/2026/not-a-chef/01-what-we-learned/`). If the post is a single `.md` file, ask before converting it to a bundle (`<slug>/index.md`); converting can change its URL if it has no `slug`.
3. **Look at each image** (Read it) so the name and alt text describe what's actually in it.
4. **Name the file**, kebab-case, by what it shows (`shredded-lettuce-rounds.png`). `.jpg` for photos (HEIC, JPEG, WebP), `.png` for screenshots and drawings. If the name is taken in the bundle, pick a more specific one; never overwrite.
5. **Process and copy.**
   - Photos: `tools/add-image.sh <source> <bundle>/<name>.jpg`. It bakes EXIF rotation into the pixels, strips all metadata (GPS included), caps the long edge at 2000 px, and refuses to overwrite. Needs ImageMagick 7 and exiftool (`brew install imagemagick exiftool`).
   - Screenshots: no metadata to strip. Cap the long edge at 2000 px with `sips -Z 2000 <file>` after copying.
   Report the output. If it fails, stop and show the error.
6. **Check rotation** for photos. Read the processed file and confirm it's upright; if not, offer to rotate it.
7. **Link it** with standard markdown on its own line, blank lines around it, using a path relative to the bundle:
   `![<alt text>](<name>.png)`
   The alt text describes what's in the image, specific and plain. Canadian spelling, no em-dashes.
8. **Show the result**: file(s) written with size and dimensions, and the diff to the post. Don't commit.

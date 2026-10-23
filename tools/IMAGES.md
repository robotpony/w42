# Banner images

Notes on generating post banners, written 2026-10-23 for review. The open decisions are at the end.

## The current look

The 2025 banners are wide watercolours, 1536x559 (about 2.75:1), hosted on images.warpedvisions.org under `YYYY/MM/`. The [turkey dinner post](https://warpedvisions.org/blog/2025/turkey-dinner-as-a-metaphor-for-scaling-software/)'s `harvest-banner.jpg` is typical:

- A soft wash of sky, teal and green on the left fading to yellow and orange on the right, with paper texture and splatter.
- A row of trees along the bottom, drawn as thin ink branches over loose blobs of leaf colour.
- Quiet space in the top two-thirds, so it sits well above a title.

The AI tells:

- The splatter looks like digital noise more than pigment.
- Some branches fade into the leaf blobs without connecting.
- The trees are cut off at the bottom with no ground.

It's also generic autumn, with nothing tied to the essay. Banners would earn more if the prompt named something from the post.

The `warped:banner-image` skill writes watercolour prompts for posts.

## Hosted: OpenAI (built)

`tools/banner.sh` calls OpenAI's image API (gpt-image-1 by default; `BANNER_MODEL` overrides it). It crops the 1536x1024 result to 1536x559 (`--crop top|center|bottom`) and saves a JPEG in the images repo under `YYYY/MM/`. `--from` recrops a saved full image without paying for a new one. See `tools/banner.sh --help`.

- **API key needed.** It's a platform.openai.com key, billed per image and separate from a ChatGPT subscription. OpenAI may ask you to verify your organization before it allows gpt-image-1. The script reads `OPENAI_API_KEY`, or else the keychain item `openai-api-key`: `security add-generic-password -a "$USER" -s openai-api-key -w`.
- **Untested end to end.** No key was set up. The cropping and the missing-key error were tested on a copy of `harvest-banner.jpg`.
- **sips quirk.** `sips` silently skips a crop that reaches the image's last row. The script stops one row short and checks the final height.
- **Strengths:** it follows prompts closely, and it gets the loose ink-and-wash look with little tuning.

## Local options (not set up)

The Mac is an M4 Pro with 48 GB, which runs local models comfortably. The limit is disk: 13 GB was free on 2026-10-23.

| Tool | Notes |
|------|-------|
| ComfyUI | Already installed (Comfy Desktop, `~/ComfyUI-Installs`, 2.6 GB, no models yet). Node-based and the most flexible, with a local HTTP API that `banner.sh` could call with a saved workflow. It has a learning curve. |
| Draw Things | A free, Mac-native app from the App Store. The easiest to get good results from, it downloads models for you and can run a local API server. |
| mflux | A command-line FLUX runner built on Apple's MLX. Easy to script, but it needs a Python setup, and FLUX models are large. |
| DiffusionBee | The simplest app, but it has fallen behind on newer models. Skip it. |

Models for the watercolour look:

- **SDXL plus a watercolour LoRA.** SDXL is about 7 GB, so it fits on the disk. Watercolour LoRAs (small style add-ons) are easy to find, and SDXL's license (OpenRAIL++) allows this use.
- **FLUX.1 schnell** (Apache 2.0) or **FLUX.1 dev** (non-commercial). Both follow prompts better and come closer to gpt-image, but with their text encoders they're well over the free space unless quantized.

Local models need more prompt tuning for this style, and they're weaker at composition, such as "an Atari beside a notebook". They're free per image and run offline, though, so you can generate a batch and pick the best one, and they fit the manifesto's "own the press" argument.

The plan is to give `banner.sh` a `--local` option that sends the prompt to ComfyUI's API, keeping the cropping and saving it has now.

## Open decisions

1. Should the local option use (A) ComfyUI with SDXL and a watercolour LoRA, or (B) Draw Things? Recommended: A, it's already installed and scriptable.
2. Should we download the SDXL model (about 7 GB)? Recommended: yes, after freeing some disk space, since the generated images and a LoRA need room too.
3. Should we set up an OpenAI API key and try `banner.sh` on the manifesto? A first prompt: "Loose watercolour on white paper, wide banner: an old Atari computer beside an open notebook of graph-paper sketches, warm autumn palette, ink linework, lots of quiet space at the top".

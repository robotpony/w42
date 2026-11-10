# Banner images

How post banners are made. OpenAI's image API is the tool (decided 2026-11-10, after the first run matched the 2025 look); the local options were dropped.

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

A post names its banner in front matter, by its path in the images repo:

```yaml
banner:
  src: 2025/10/harvest-banner.jpg
  alt: "AI-generated watercolour banner: …"
```

Alt text is required (the theme leaves out a banner without it). Width and height default to 1536x559. The preview serves the file from the local images repo, so it shows before the images repo is pushed and deployed.

## OpenAI (`tools/banner.sh`)

`tools/banner.sh` calls OpenAI's image API (gpt-image-2.6-sunburst by default, the detail model; `BANNER_MODEL` overrides it, e.g. with the faster gpt-image-2.6-flare). It asks for a 1536x560 image, the banner shape rounded to the API's multiples of 16, and trims a row to 1536x559 (`--crop` picks the band when a `--from` image is taller) and saves a JPEG in the images repo under `YYYY/MM/`. `--from` recrops a saved full image without paying for a new one. See `tools/banner.sh --help`.

- **API key needed.** It's a platform.openai.com key, billed per image and separate from a ChatGPT subscription. Setup is below.
- **Model and size.** `--check` confirmed gpt-image-2.6-sunburst on 2026-11-10; plain gpt-image-1 is gone from the model list, so the old default would fail even with a good key. Custom sizes follow the docs (multiples of 16, ratio up to 3:1); the first real call (2026-11-10, a test banner since deleted) took 1536x560 in 38 seconds and needed no organization verification. The cropping was tested on 1536x560 and 1536x1024 copies of `harvest-banner.jpg`.
- **Prompt guard.** The model draws lettering, logos and code faithfully, and invented code or sprites would pass for Bruce's real old work. So the script adds a line to every prompt by default: no text, logos, code or sprites, and any pages and screens left blank. `--allow-marks` leaves it off for a post that wants those on purpose.
- **Mocks first.** Every generated banner is a mock: the script opens it for review, and it goes in a post (and the images repo is committed) only once Bruce approves it. A rejected banner is deleted, and the prompt is revised for the next run.
- **sips quirk.** `sips` silently skips a crop that reaches the image's last row. The script stops one row short and checks the final height.
- **Strengths:** it follows prompts closely, and it gets the loose ink-and-wash look with little tuning.

### Setting up the API key

1. **Create the key** at platform.openai.com › API keys, in the project you want billed. Billing needs a card or credit. Copy it with the copy button: OpenAI shows the full key only once.
2. **Save it from the clipboard** into the login keychain:

   ```
   security add-generic-password -U -a "$USER" -s openai-api-key -w "$(pbpaste)"
   ```

   Don't run it with a bare `-w` and paste at the prompt. The prompt keeps only the first 128 characters, and `sk-proj-` keys are about 164, so it saves a key missing its end, and OpenAI rejects it as "Incorrect API key" (what happened on 2026-11-10). `-U` replaces an existing item; without it the command fails with "already exists" and keeps the old key. `$USER` only fills the item's account field; the script finds the key by its service name.
3. **Clear the clipboard.** Copy something harmless, and delete the key from Space Command's Clipboard tab if it filed it.
4. **Check it** (free, and never prints the key):

   ```
   tools/banner.sh --check
   ```

   It reports where the key came from, its length and last four characters (compare them with the dashboard's masked key), the image models the key can use, and whether the default model is one of them.

If `--check` fails:

- **"Incorrect API key"** with last four characters that don't match the dashboard: the saved key is cut short or the wrong one. Save it again from the clipboard.
- **A different key than expected:** an `OPENAI_API_KEY` in the environment wins over the keychain. In fish, `set -q OPENAI_API_KEY; and echo set` shows one; remove it from your config.
- **Default model missing:** the project's Limits tab (Project Settings) may block it, or the ID has changed. Set `BANNER_MODEL` to one the check lists.
- **"must be verified"** on the first real call (the check can't see it): verify the organization at platform.openai.com/settings/organization/general. That's organization settings, a level above the Project Settings tabs. Access can take about 15 minutes to arrive.

## Local options (dropped)

ComfyUI (SDXL with a watercolour LoRA), Draw Things, mflux and DiffusionBee were weighed on 2026-11-09. They're free per image and run offline, but they need more prompt tuning and compose worse. The first OpenAI banner (2026-11-10) matched the 2025 look closely, so they were dropped; git history has the comparison.

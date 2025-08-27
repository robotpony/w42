# warpedvisions.org

A personal site by Bruce Alderson featuring essays on craft, makery, and software, along with recipes and creative projects. The site has been continuously evolving since before "weblogs" existed, serving as both a creative outlet and testing ground for new tools and techniques.

## Quick Start

```bash
# Start development server with live reloading
hugo server

# Include draft posts in development
hugo server --buildDrafts

# Build static site to /public directory
hugo

# Deploy to production
./deploy.sh
```

## Content Structure

- `/content/blog/YYYY/` - Blog posts organized by year (2008-2025)
- `/content/food/` - Recipes and cooking content
- `/content/projects/` - Maker projects and art
- `/content/pages/` - Static pages (about, style guide)

## Theme

The site uses a custom Hugo theme called "w42" (located in `themes/w42/`):
- Based on PaperMod with extensive customizations
- Optimized for readability and clean design
- "Warped" branding with colorful header/footer accents
- Rainbow-colored article links with hover effects
- 40+ language translations
- Responsive mobile-first design

## Key Files

- `hugo.toml` - Site configuration
- `CLAUDE.md` - AI assistant guidance for code editing
- `TASKS.md` - Development todo list
- `deploy.sh` - Deployment script (rsync to remote server)

## Features

- Google Analytics integration
- Light theme by default
- Built-in search functionality
- Year-based content organization
- Content editor configured for vim
- Draft mode visibility controls

## Development Notes

- Pure Hugo implementation (no package.json/npm)
- Static assets served from `/static`
- Generated content in `/public` (not version controlled)
- Extensive content history dating back to 2008

## About

Bruce Alderson designs and crafts software for fun and profit, while also writing and making artful things. The site focuses on the distinct, the curious, and the wondrous - believing that simplicity is achieved when things fit *just so*.

No comments or contact forms here - the best filter is public discourse. Write a response somewhere and link back. It takes more effort than a comment and gets you writing.

## Site Details

- **URL**: https://warpedvisions.org/
- **Author**: Bruce Alderson
- **Social**: [@robotpony.bsky.social](https://bsky.app/profile/robotpony.bsky.social)
- **Hosting**: Dreamhost (20+ years and counting)
- **Generator**: Hugo (previously Wordpress, Jekyll, Movable Type, Blosxom, and many others)

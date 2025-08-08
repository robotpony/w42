# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for warpedvisions.org, a personal blog focused on essays, recipes, and maker projects. The site uses a custom Hugo theme called "w42" (located in themes/w42/), which is based on PaperMod with significant customizations for high readability and clean design.

## Development Commands

**Build and serve:**
- `hugo server` - Start development server with live reloading
- `hugo server --buildDrafts` - Include draft posts in development
- `hugo` - Build static site to /public directory

**Content creation:**
- Content editor is configured to use `vim` (hugo.toml:17)
- Blog posts go in `content/blog/YYYY/` following year-based organization
- Recipes go in `content/food/`
- Projects go in `content/projects/`

**Deployment:**
- `./deploy.sh` - Builds site and deploys via rsync to remote server

## Architecture

### Site Structure
- **Content organized by type and year:**
  - `content/blog/` - Blog posts organized by year (2008-2025)
  - `content/food/` - Recipes and cooking content
  - `content/projects/` - Maker projects and art
  - `content/pages/` - Static pages (about, etc.)

- **Theme architecture (themes/w42/):**
  - Based on PaperMod with custom "Warped" branding
  - Modular CSS in `assets/css/` (core/, common/, extended/)
  - Custom JavaScript in `assets/js/warped.js` 
  - Hugo templates in `layouts/`
  - 40+ language translations in `i18n/`

### Configuration
- **hugo.toml** contains all site configuration
- BuildDrafts enabled by default
- Google Analytics integration (G-77V9MKYGJ8)
- Custom CSS/JS paths configured
- Security settings allow sass, git, vim, etc.

### Content Format
Blog posts use Hugo front matter with:
- `slug` for URL
- `title` and `date`
- `draft: false` for published posts
- Tags for categorization
- All content uses a-style-guide-for-bruce.md as a style guide, including formatting headers and titles

## Key Features

### Theme Customizations
- Custom "Warped" branding with colorful header/footer bars
- Rainbow-colored article links with hover effects
- High readability focus with clean typography
- Responsive mobile-first design
- Light theme by default
- Search functionality built-in

### Content Types
- **Essays** - Long-form writing about technology, productivity, design
- **Recipes** - Structured cooking content with images
- **Projects** - Art, maker projects, technical experiments
- **HOWTOs** - Technical tutorials and guides

## Development Notes

- Site has extensive content history (2008-2025)
- No package.json - pure Hugo implementation
- Static assets served from /static
- Generated content in /public (not version controlled)
- Deploy script uses rsync to remote server
- Theme has comprehensive CLAUDE.md documentation

## Current Tasks

From TASKS.md:
- Testing Claude integration (in progress)
- Need to figure out `hugo new` content syntax + scripting
- Adding tags to posts
- Reviewing theme improvements
- Adding proper draft mode visibility controls
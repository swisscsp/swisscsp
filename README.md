# Swiss Cyber Security Platform — Jekyll site

A rebuild of swisscsp.ch (previously GoDaddy Website Builder) as a plain Jekyll
site that GitHub Pages builds and hosts for free.

## Publish on GitHub Pages

1. Create a new repository on GitHub (for example `swisscsp`).
2. Upload the **contents** of this folder to it (drag the files into
   *Add file → Upload files*, or use `git push`).
3. In the repository go to **Settings → Pages**, set *Source* to
   **Deploy from a branch**, branch `main`, folder `/ (root)`, and save.
4. After a minute the site is live at `https://YOUR-USER.github.io/swisscsp/`.

**Important:** if the site lives at `https://YOUR-USER.github.io/REPO/`,
open `_config.yml` and set `baseurl: "/REPO"` (and `url:` to
`https://YOUR-USER.github.io`). For a custom domain such as swisscsp.ch,
keep `baseurl: ""`.

### Using the swisscsp.ch domain

1. In **Settings → Pages → Custom domain** enter `swisscsp.ch` (this adds a
   `CNAME` file to the repository).
2. At your DNS provider (GoDaddy) point the domain to GitHub Pages:
   four `A` records for `@` → `185.199.108.153`, `185.199.109.153`,
   `185.199.110.153`, `185.199.111.153`, and a `CNAME` record for `www` →
   `YOUR-USER.github.io`.
3. Once the check passes, tick **Enforce HTTPS**.

## Editing content

| What | Where |
|---|---|
| Site name, LinkedIn links, form service, calendar | `_config.yml` |
| Header menu | `_data/navigation.yml` |
| Events on the Agenda page | `_data/events.yml` |
| Partner / community posts | `_posts/` — one file per post |
| Page text | the `.html` file with the page's name (e.g. `contact-us.html`) |
| Header, footer, post list, forms | `_includes/` |
| Page templates | `_layouts/` |
| Colours and fonts | `assets/css/main.css` (variables at the top) |
| Images | `assets/images/` |

### Adding a partner or community post

Copy a file in `_posts/`, rename it `YYYY-MM-DD-short-name.html`, and change
the front matter at the top:

```yaml
---
title: Example Association
categories: [Community, Partner]   # "Partner" also shows it on the home page
image: /assets/images/posts/example-logo.png
summary: One or two sentences shown in the post list.
---
<p>The full text of the post…</p>
```

Use the category `Agency` to list a post on the Agencies page.

### Forms

GitHub Pages hosts static files only, so it cannot receive form submissions.
Create a free form at a service such as [Formspree](https://formspree.io), then
paste its endpoint (`https://formspree.io/f/xxxxxxx`) into `form_endpoint`
in `_config.yml`. Until then the subscribe and contact forms show a
"Contact us on LinkedIn" button instead.

## Preview locally (optional)

GitHub builds the site itself, so this is only for previewing on your Mac.
In Terminal, from this folder, run:

```bash
./serve.sh
```

Then open http://localhost:4000 (stop it with Ctrl+C).

The script doesn't touch your shell settings: it uses Homebrew's Ruby 3.3
(installed on first run, kept separate from macOS's own Ruby) only while it
runs, and keeps the gems in `vendor/bundle` inside this folder. To remove it
all later: delete `vendor/` and `.bundle/`, and run `brew uninstall ruby@3.3`.

## What changed compared to the GoDaddy site

- Member login / create account pages were removed (GitHub Pages has no user
  accounts); the account icon is gone from the header.
- The cookie banner, TrustedSite badge, chat bubble and "Powered by GoDaddy"
  were removed — the site no longer sets any cookies.
- The privacy policy (`datenschutzerklaerung.html`) needs its text pasted in;
  on GoDaddy it was behind the login, so it wasn't in the offline copy.
- Blog posts keep their old addresses (`/for-customers/f/…`), apart from the
  Offiziersgesellschaft Cyber post, which now has a shorter address.

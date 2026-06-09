# PawPrint — AI Pet Intelligence Platform

PawPrint is a web app where dog and cat owners upload a photo of their pet, fill in details (breed, age, name, traits), and receive an AI-powered breed analysis using Claude Vision. Every submission is saved to a Supabase database — building a labeled training dataset for future instant breed identification.

## What PawPrint Does

- **Phase 1 (Live):** Upload a pet photo + details → receive a full AI breed profile (temperament, care notes, traits, fun facts)
- **Phase 2 (Coming Soon):** Drop a photo with no manual input → instant breed ID powered by the dataset collected in Phase 1

## Local Development

### Prerequisites

- [Node.js](https://nodejs.org) 18+
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (for the local Supabase stack)
- [Supabase CLI](https://supabase.com/docs/guides/cli) — install via `brew install supabase/tap/supabase`

### 1. Clone and install

```bash
git clone <repo-url>
cd pawprint
npm install
```

### 2. Start the local Supabase stack

```bash
supabase start
```

This spins up a full Postgres + PostgREST + Storage stack locally via Docker and applies all migrations automatically. To get your credentials in a copy-paste friendly format run:

```bash
supabase status --output env
```

### 3. Configure environment variables

```bash
cp .env.example .env.local
```

Open `.env.local` and fill in the values from `supabase status --output env`:

```
NEXT_PUBLIC_SUPABASE_URL=  ← API_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY=  ← ANON_KEY
SUPABASE_SERVICE_ROLE_KEY=  ← SERVICE_ROLE_KEY
ANTHROPIC_API_KEY=  ← from console.anthropic.com
```

### 4. Run the app

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

### 5. (Optional) Load sample data

```bash
supabase db reset
```

This resets the local database, re-runs all migrations, and loads `supabase/seed.sql` — giving you three sample submissions to work with immediately.

### Useful local development commands

```bash
supabase status          # Show local service URLs and keys
supabase stop            # Stop all local containers
supabase db reset        # Wipe and re-seed local database
supabase studio          # Open local Supabase Studio (GUI)
```

## Database Schema

The schema is managed as migrations in `supabase/migrations/`. All migrations run automatically on `supabase start`.

**`submissions` table** — stores every pet submission with the owner's input and Claude's analysis.

To create a new migration:

```bash
supabase migration new <name>
```

## Connecting to a Remote Supabase Project

To use a hosted Supabase project instead of local:

1. Create a project at [supabase.com](https://supabase.com)
2. Run the migration in **SQL Editor** → paste the contents of `supabase/migrations/20240101000000_initial_schema.sql`
3. Go to **Storage** → **New Bucket** → name it `pet-photos` → set to **Public**
4. Copy your project URL and API keys from **Settings → API** into `.env.local`

To link the Supabase CLI to your remote project:

```bash
supabase login
supabase link --project-ref <your-project-ref>
supabase db push   # push local migrations to remote
```

## Deploy to Vercel

1. Push your code to GitHub
2. Import the repo at [vercel.com/new](https://vercel.com/new)
3. Add all four environment variables in the Vercel project settings
4. Deploy — Vercel auto-detects Next.js

## The Data Flywheel

```
Phase 1: Owners submit labeled photos
       ↓
We build a visual breed training dataset
       ↓
AI learns to identify breeds from images alone
       ↓
Phase 2: Instant ID — no forms needed
```

Every submission in Phase 1 directly improves the accuracy and speed of Phase 2 breed identification. The more pets submitted, the smarter the system gets.

## Tech Stack

- **Frontend:** Next.js (App Router) + TypeScript
- **Styling:** Tailwind CSS
- **Database:** Supabase (Postgres) with Row Level Security
- **AI:** Anthropic Claude (claude-sonnet-4) with vision
- **Image Storage:** Supabase Storage
- **Deployment:** Vercel

## Contributing

1. Fork the repo
2. Follow the **Local Development** steps above
3. Open a pull request

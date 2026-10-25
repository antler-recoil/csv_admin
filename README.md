# Admin Dashboard

A Ruby on Rails admin dashboard for managing workspace users. It gives administrators a clear overview of who has access, what role they hold, and when they last signed in, and lets them export that list as a CSV file for reporting.

## Features

- **User directory:** a sortable table of all users with name, email, role, activity status and last login.
- **At-a-glance metrics:** total users, users active this week, and users who have never logged in.
- **Role breakdown:** a visual split of admins, editors and viewers.
- **CSV export:** download the current user list as a spreadsheet-friendly CSV (UTF-8, Excel-compatible).
- **Responsive admin layout:** sidebar navigation, top bar with search, and card-based content built with Tailwind CSS.

## Tech stack

| Layer      | Technology                        |
|------------|-----------------------------------|
| Framework  | Ruby on Rails                     |
| Language   | Ruby 3.x                          |
| Database   | SQLite 3 (default Rails setup)    |
| Styling    | Tailwind CSS (`tailwindcss-rails`) |
| Exports    | Ruby `csv` library                |

## Requirements

- Ruby 3.2 or newer (3.4+ recommended)
- Bundler (`gem install bundler`)
- SQLite 3
- Git

Check your versions:

```bash
ruby -v
bundle -v
sqlite3 --version
```

## Getting started

### 1. Clone and install

```bash
git clone <your-repository-url> csv_export_demo
cd csv_export_demo
bundle install
```

### 2. Set up the database

```bash
rails db:create db:migrate
rails db:seed
```

The seed script creates 18 sample users with a mix of roles (admin, editor, viewer) and login times, including one user who has never logged in. Running `rails db:seed` again resets the data.

### 3. Run the app

Use the dev script so Tailwind compiles and watches for changes:

```bash
bin/dev
```

Then open <http://localhost:3000>. The root path redirects to `/admin/users`.

> Running plain `rails server` starts the app but does not rebuild Tailwind styles, so use `bin/dev` during development.

## Using the app

| Route                   | Description                              |
|-------------------------|------------------------------------------|
| `/admin/users`          | User dashboard (HTML)                    |
| `/admin/users.csv`      | CSV download of all users                |

To export, click **Export** in the page header, or visit `/admin/users.csv` directly. The file is named `users-YYYY-MM-DD.csv`.

### CSV format

| Column            | Example                       |
|-------------------|-------------------------------|
| ID                | `1`                           |
| First Name        | `Priya`                       |
| Last Name         | `Raman`                       |
| Email             | `priya.raman@example.com`     |
| Role              | `admin`                       |
| Last Login (UTC)  | `2026-10-23 17:52:53`         |

Notes:

- Rows follow the same order as the dashboard (last name, then first name).
- Users who have never logged in have an empty **Last Login** cell.
- The file starts with a UTF-8 byte order mark so Excel displays accented characters correctly.

## Project structure

```
app/
  controllers/admin/users_controller.rb   # index action, HTML + CSV responses
  helpers/application_helper.rb           # inline SVG icons and avatar colours
  models/user.rb                          # User model and CSV generation
  views/
    layouts/application.html.erb          # sidebar and top bar shell
    admin/users/index.html.erb            # dashboard page
config/routes.rb                          # /admin/users namespace
db/
  migrate/                                # users table migration
  seeds.rb                                # sample data
```

## Data model

**User**

| Field           | Type     | Notes                          |
|-----------------|----------|--------------------------------|
| `first_name`    | string   |                                |
| `last_name`     | string   |                                |
| `email`         | string   | unique index                   |
| `role`          | string   | `admin`, `editor` or `viewer`  |
| `last_login_at` | datetime | `nil` if the user never signed in |

## Troubleshooting

**Styles look broken or missing.** Make sure you started the app with `bin/dev`. If you ran `rails server`, stop it and use `bin/dev` instead.

**`cannot load such file -- csv` on Ruby 3.4+.** The `csv` library is no longer a default gem. Add it with `bundle add csv` and run `bundle install`.

**Accented characters look garbled in Excel.** Confirm the controller prepends the UTF-8 BOM (`"\uFEFF"`) to the CSV output.

**Port 3000 is already in use.** Run `PORT=3001 bin/dev` and open <http://localhost:3001>.

## Development workflow

Work happens on feature branches off `main`:

```bash
git checkout -b feature/your-feature
# make changes
git add -A
git commit -m "Describe your change"
```

## Roadmap

- Authentication and authorisation for admin access
- Working search, filters and pagination on the users table
- Role-based filtering of exports
- Background jobs for large exports

## License

Proprietary. All rights reserved.

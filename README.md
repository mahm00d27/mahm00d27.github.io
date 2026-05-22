# 🌐 Mahmoodur Rahman – Professional Portfolio Site. used

A production-ready personal website built with:

- MkDocs (Material theme)
- Python tooling
- GitHub Actions (CI/CD)
- GitHub Pages (free hosting)

---

# 🔗 Live Site

👉 https://mahm00d27.github.io

---

# 📊 Repository Health

https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/ci.yml/badge.svg  
https://github.com/mahm00d27/mahm00d27.github.io/actions/workflows/deploy.yml/badge.svg  
https://img.shields.io/badge/license-MIT-green

✅ All tests must pass before deployment  
✅ Deployment is fully automated  

---

# 🧪 Testing

Run tests locally:

```bash
PYTHONPATH=src pytest
```

---

# 💻 Local Development

If you want to run this project locally, follow these steps.

## 1. Clone the repository

```bash
git clone https://github.com/mahm00d27/mahm00d27.github.io.git
cd mahm00d27.github.io
```

---

## 2. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 3. Run the site locally

```bash
mkdocs serve
```

Open in your browser:

👉 http://127.0.0.1:8000

---

# 🔄 Contribution Workflow

I follow a structured workflow for all changes to this repository.

All updates — including my own — go through:

```
branch → commit → push → pull request → CI → merge → deploy
```

---

# 🤝 How to Contribute

If you want to propose improvements or fixes, please follow this process.

## ✅ Step 1 — Get the Repository

### If you have access

```bash
git clone https://github.com/mahm00d27/mahm00d27.github.io.git
cd mahm00d27.github.io
```

### If you are an external contributor

1. Click **Fork**
2. Clone your fork:

```bash
git clone https://github.com/<your-username>/mahm00d27.github.io.git
cd mahm00d27.github.io
```

---

## ✅ Step 2 — Create a Branch

Do NOT work directly on `main`.

```bash
git checkout -b feature/short-description
```

---

## ✅ Step 3 — Make Changes

Modify:

- docs/ → content  
- src/ → logic  
- mkdocs.yml → configuration

---

## ✅ Step 4 — Test Locally

```bash
PYTHONPATH=src pytest
```

```bash
mkdocs serve
```

👉 http://127.0.0.1:8000

---

## ✅ Step 5 — Commit

```bash
git add .
git commit -m "clear message"
```

---

## ✅ Step 6 — Push

```bash
git push origin feature/your-branch
```

---

## ✅ Step 7 — Open a Pull Request

- Go to GitHub
- Click "Compare & pull request"
- Add description

---

# 🧪 Automated Checks (CI)

When a PR is opened, I rely on automated checks:

- ✅ pytest
- ✅ environment setup
- ✅ build validation

---

# ✅ Merge Rules (Maintained by Mahmoodur Rahman)

I merge only if:

- ✅ CI passes
- ✅ no errors
- ✅ aligns with project purpose

---

# 🚀 Deployment

After merge:

```
merge → build → deploy → live update
```

Site is automatically published.

---

# 🚫 Rules

- ❌ No direct commits to main
- ❌ No failing PR merges
- ❌ No skipping CI

---

# 🔐 Repository Settings

Configured under:

```
Settings → Branches
```

Rules:
- ✅ PR required
- ✅ CI required

---

# ⚙️ CI/CD Pipeline

## CI
Runs on push + PR

## CD
Runs on merge → deploys site

---

# 📁 Project Structure

```
.
├── docs/
├── src/mysite/
├── tests/
├── mkdocs.yml
├── requirements.txt
├── .github/workflows/
└── README.md
```

---

# 🧠 Philosophy

- Reproducibility
- Automation-first
- CI/CD discipline
- Clean structure

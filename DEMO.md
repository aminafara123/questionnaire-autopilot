# 60-second demo script

Goal: show a security questionnaire getting auto-drafted from policy docs, with
citations, confidence, and review flags. Record `docs/demo.gif` from these steps.

## Setup (before recording)
- `pip install -r requirements.txt`
- (Optional) have a local ollama running, or set `LLM_*` env vars. The demo works
  without a model too; it just emits cited excerpts and flags them.
- Clear old output: `make clean`

## Recording (~60s)

1) **Show the inputs (10s)**
   - `cat input/questions.csv` — 15 real SOC2/ISO27001/CAIQ questions.
   - `ls policies/` — six short policy docs (access control, encryption, incident
     response, data retention, BCP/DR, vendor management).

2) **Run it (10s)**
   - `python autopilot.py`
   - Point at the summary line: "Drafted 15 answers -> output/ (3 flagged for review)".

3) **Open the filled spreadsheet (20s)**
   - Open `output/answers.xlsx`.
   - Top row: the AI-DRAFT disclaimer banner.
   - Columns: Question, Draft Answer, Cited Source, Confidence, Needs Review.
   - Highlight a high-confidence answer (MFA, encryption) with its cited section.
   - Scroll to the yellow-highlighted rows: background checks / pen testing —
     flagged because no policy covers them.

4) **Show the review report (15s)**
   - `cat output/review-report.md` — high/medium/low counts and the exact list of
     questions a human must review.

5) **Close on the honesty line (5s)**
   - Narrate: "Every answer is an AI draft a qualified person reviews before it
     ships. It's a drafting aid, not a compliance guarantee."

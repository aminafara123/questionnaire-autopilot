.PHONY: install test run clean

install:
	python -m pip install -r requirements.txt

test:
	pytest -q

run:
	python autopilot.py --questions input/questions.csv --policies policies --out output

clean:
	rm -f output/answers.csv output/answers.xlsx output/review-report.md
	rm -rf .pytest_cache __pycache__ tests/__pycache__

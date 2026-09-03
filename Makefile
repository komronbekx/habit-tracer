

setup:
	uv run python manage.py makemigrations
	uv run python manage.py migrate
	uv run python manage.py createsuperuser
	uv run python manage.py createcachetable

seed:
	uv run python manage.py shell -c "import scripts.seed"

dev:
	uv run python manage.py runserver 0.0.0.0:8000

lint:
	uv run ruff check .

format:
	uv run ruff format .

typecheck:
	uv run mypy .

test:
	uv run python manage.py test

migrations:
	uv run python manage.py makemigrations
	uv run python manage.py migrate

check-migration:
	uv run python manage.py makemigrations --check --dry-run

ci: lint format typecheck test check-migration
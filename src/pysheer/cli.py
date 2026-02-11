"""CLI mínima do pysheer."""

import click


@click.group()
def main() -> None:
    """Entrypoint do pysheer."""


if __name__ == "__main__":
    main()

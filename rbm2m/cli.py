import click


@click.command()
@click.option('--as-cowboy', '-c', is_flag=True, help='Greet as a cowboy.')
@click.argument('name', default='world', required=False)
def main(name, as_cowboy):
    """Move things from one place to another, massively."""
    greet = 'Howdy' if as_cowboy else 'Hello'
    click.echo('{0}, {1}.'.format(greet, name))

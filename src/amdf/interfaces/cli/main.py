"""
AMDF CLI Main Entry Point
"""

import typer
from rich.console import Console
from rich.table import Table

from ...core.logic.generator import list_available_crds, KCLSchemaGenerator
from ...core.logic.blueprint import generate_blueprint_from_schema
from pathlib import Path

app = typer.Typer(
    name="amdf",
    help="Agnostic Multi-cloud Delivery Framework",
    rich_markup_mode="rich"
)
console = Console()


@app.command()
def list_crds(
    filter_text: str = typer.Option(None, "--filter", "-f", help="Filter CRDs by text"),
    context: str = typer.Option(None, "--context", "-c", help="Kubernetes context")
):
    """List available CRDs in the cluster"""
    try:
        crds = list_available_crds(context)
        
        if filter_text:
            crds = [crd for crd in crds if filter_text.lower() in crd.lower()]
        
        if not crds:
            console.print("[yellow]No CRDs found[/yellow]")
            return
        
        table = Table(title="Available CRDs")
        table.add_column("CRD Name", style="cyan")
        
        for crd in crds:
            table.add_row(crd)
        
        console.print(table)
        console.print(f"\n[green]Found {len(crds)} CRDs[/green]")
        
    except Exception as e:
        console.print(f"[red]Error: {e}[/red]")
        raise typer.Exit(1)


@app.command()
def generate(
    crd_name: str = typer.Argument(..., help="Name of the CRD to generate schema for"),
    output_dir: str = typer.Option(".", "--output", "-o", help="Output directory"),
    context: str = typer.Option(None, "--context", "-c", help="Kubernetes context"),
    with_blueprint: bool = typer.Option(True, "--blueprint/--no-blueprint", help="Generate blueprint")
):
    """Generate KCL schema from CRD"""
    try:
        console.print(f"[blue]Generating schema for CRD: {crd_name}[/blue]")
        
        # Generate schema
        generator = KCLSchemaGenerator(crd_name=crd_name, context=context)
        schema_path, schema_content = generator.generate(base_dir=output_dir)
        
        console.print(f"[green]✅ Schema generated: {schema_path}[/green]")
        
        # Generate blueprint if requested
        if with_blueprint:
            console.print("[blue]Generating blueprint...[/blue]")
            
            blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(
                schema_content, Path(schema_path)
            )
            
            if bp_name:
                # Save blueprint
                blueprint_dir = Path(output_dir) / "library" / "blueprints"
                blueprint_dir.mkdir(parents=True, exist_ok=True)
                blueprint_path = blueprint_dir / f"{main_schema_name}.k"
                
                with open(blueprint_path, "w", encoding='utf-8') as f:
                    f.write(blueprint_code)
                
                console.print(f"[green]✅ Blueprint generated: {blueprint_path}[/green]")
            else:
                console.print("[yellow]⚠️ Blueprint generation failed[/yellow]")
        
        console.print("\n[green]🎉 Generation completed successfully![/green]")
        
    except Exception as e:
        console.print(f"[red]Error: {e}[/red]")
        raise typer.Exit(1)


@app.command()
def guided(
    ai_model: str = typer.Option(None, "--ai-model", help="Enable AI explanations with specified Ollama model")
):
    """Guided schema generation with step-by-step workflow"""
    try:
        if ai_model:
            console.print(f"[blue]🤖 Starting AMDF Guided Mode with {ai_model}[/blue]")
            from .guided import start_guided_mode
            start_guided_mode(ai_model)
        else:
            console.print("[blue]🔧 Starting AMDF Guided Mode[/blue]")
            from .guided import start_guided_mode
            start_guided_mode(None)
    except Exception as e:
        console.print(f"[red]Error starting guided mode: {e}[/red]")
        raise typer.Exit(1)


@app.command()
def mcp_server():
    """Start the MCP server"""
    try:
        console.print("[blue]Starting AMDF MCP Server...[/blue]")
        from ...interfaces.mcp.server import server
        server.run()
    except Exception as e:
        console.print(f"[red]Error starting MCP server: {e}[/red]")
        raise typer.Exit(1)


@app.command()
def version():
    """Show AMDF version"""
    from ... import __version__
    console.print(f"AMDF version: [green]{__version__}[/green]")


if __name__ == "__main__":
    app()

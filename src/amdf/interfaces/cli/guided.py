"""
AMDF Guided Interactive Mode
"""

from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.prompt import Prompt

from ...core.logic.generator import list_available_crds, KCLSchemaGenerator
from ...core.logic.blueprint import generate_blueprint_from_schema
from pathlib import Path

console = Console()


def start_guided_mode():
    """Start guided interactive mode"""
    try:
        # Welcome
        console.print(Panel.fit("Welcome! Let's generate KCL schemas step by step.", title="🔧 AMDF Guided"))

        # Step 1: Filter CRDs
        console.print("\n[bold blue]Step 1: Filter CRDs[/bold blue]")
        crd_filter = Prompt.ask("Filter CRDs (or Enter for all)", default="").strip()

        console.print(f"[dim]🔍 Searching CRDs{f' with: {crd_filter}' if crd_filter else ''}...[/dim]")

        # List CRDs
        crds = list_available_crds(None)
        if crd_filter:
            crds = [crd for crd in crds if crd_filter.lower() in crd.lower()]

        if not crds:
            console.print("[yellow]No CRDs found[/yellow]")
            return

        # Step 2: Select CRD
        console.print(f"\n[bold blue]Step 2: Select CRD ({len(crds)} found)[/bold blue]")

        table = Table()
        table.add_column("#", style="cyan", width=4)
        table.add_column("CRD Name", style="white")

        display_count = min(len(crds), 15)
        for i, crd in enumerate(crds[:display_count], 1):
            table.add_row(str(i), crd)

        console.print(table)
        if len(crds) > 15:
            console.print(f"[dim]... and {len(crds) - 15} more[/dim]")

        # Get selection
        while True:
            selection = Prompt.ask(f"Select number (1-{display_count}) or full name").strip()

            if selection.isdigit():
                idx = int(selection) - 1
                if 0 <= idx < display_count:
                    selected_crd = crds[idx]
                    break
            elif selection in crds:
                selected_crd = selection
                break
            console.print("[red]Invalid selection[/red]")

        # Step 3: Generate
        console.print(f"\n[bold blue]Step 3: Generate Schema[/bold blue]")
        console.print(f"[dim]⚙️ Generating for: {selected_crd}...[/dim]")

        generator = KCLSchemaGenerator(crd_name=selected_crd, context=None)
        schema_path, schema_content = generator.generate(base_dir=".")
        console.print(f"[green]✅ Schema: {schema_path}[/green]")

        # Generate blueprint
        blueprint_code, bp_name, main_schema_name = generate_blueprint_from_schema(
            schema_content, Path(schema_path)
        )

        if bp_name:
            blueprint_dir = Path(".") / "library" / "blueprints"
            blueprint_dir.mkdir(parents=True, exist_ok=True)
            blueprint_path = blueprint_dir / f"{main_schema_name}.k"

            with open(blueprint_path, "w", encoding='utf-8') as f:
                f.write(blueprint_code)

            console.print(f"[green]✅ Blueprint: {blueprint_path}[/green]")

        # Summary
        console.print(f"\n[bold green]🎉 Complete![/bold green]")
        console.print(f"Generated schema and blueprint for [cyan]{selected_crd}[/cyan]")

    except KeyboardInterrupt:
        console.print("\n[yellow]👋 Goodbye![/yellow]")

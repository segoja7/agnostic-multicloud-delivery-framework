"""
AMDF Guided Interactive Mode
"""

import asyncio
from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.prompt import Prompt

from ...core.logic.generator import list_available_crds, KCLSchemaGenerator
from ...core.logic.blueprint import generate_blueprint_from_schema
from pathlib import Path

console = Console()


def start_guided_mode(ai_model: str = None):
    """Start guided interactive mode"""
    asyncio.run(_guided_workflow(ai_model))


async def _guided_workflow(ai_model: str = None):
    """Main guided workflow"""
    try:
        # Welcome
        title = "🤖 AMDF Guided + AI" if ai_model else "🔧 AMDF Guided"
        console.print(Panel.fit(f"Welcome! Let's generate KCL schemas step by step.", title=title))

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
        
        blueprint_path = None
        if bp_name:
            blueprint_dir = Path(".") / "library" / "blueprints"
            blueprint_dir.mkdir(parents=True, exist_ok=True)
            blueprint_path = blueprint_dir / f"{main_schema_name}.k"
            
            with open(blueprint_path, "w", encoding='utf-8') as f:
                f.write(blueprint_code)
            
            console.print(f"[green]✅ Blueprint: {blueprint_path}[/green]")

        # Step 4: AI Explanation
        if ai_model:
            console.print(f"\n[bold blue]Step 4: AI Explanation[/bold blue]")
            await _get_ai_explanation(ai_model, selected_crd, blueprint_path)

        # Summary
        console.print(f"\n[bold green]🎉 Complete![/bold green]")
        console.print(f"Generated schema and blueprint for [cyan]{selected_crd}[/cyan]")

    except KeyboardInterrupt:
        console.print("\n[yellow]👋 Goodbye![/yellow]")


async def _get_ai_explanation(ai_model: str, crd_name: str, blueprint_path: str):
    """Get AI explanation"""
    try:
        import ollama
        
        console.print(f"[dim]🤖 Getting explanation from {ai_model}...[/dim]")
        
        # Read both schema and blueprint content for full context
        blueprint_content = ""
        if blueprint_path and Path(blueprint_path).exists():
            with open(blueprint_path, 'r') as f:
                blueprint_content = f.read()

        # Create comprehensive generation output summary
        generation_output = f"""
Schema generado: {blueprint_path}
Blueprint generado: {blueprint_path}

Contenido del Blueprint:
{blueprint_content}
"""

        # Use the more effective prompt from the original client
        ollama_prompt = f"""
Actúa como un experto en KCL.
He ejecutado una herramienta que genera un Schema KCL y un Blueprint KCL para el CRD '{crd_name}'.
Aquí está la salida de la herramienta:
{generation_output}

Por favor, explica al usuario qué significan estos archivos y cómo se usaría el Blueprint en un archivo KCL principal (main.k).
Ofrece un ejemplo de cómo importar y usar el blueprint '{crd_name.split('.')[-1]}' en KCL.
Incluye también las mejores prácticas para configurar los parámetros principales.
"""

        response = ollama.chat(
            model=ai_model,
            messages=[{'role': 'user', 'content': ollama_prompt}]
        )
        
        console.print(Panel.fit(
            response['message']['content'],
            title=f"🤖 {ai_model} - Experto en KCL",
            border_style="blue"
        ))
        
    except Exception as e:
        console.print(f"[yellow]⚠️ AI explanation failed: {e}[/yellow]")

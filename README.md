# Altium Project Parameters Script

Altium Designer script project (`Script_Project.PrjScr`) for exporting a
project's parameters to a text file. `test.txt` is a sample of the output: one
`Name;Value` line per project parameter, here `Date;05/2025` and
`Designation;custom project name`, which are the parameters defined in the
script project itself.

> The script the project points to, `Prj-Parameters.pas` (set as
> `StartProcName=Prj-Parameters.pas>`), is **not in this repository**. Add it
> next to `Script_Project.PrjScr` before running the project.

## Repository layout

```
0011_altium_params/
├── Script_Project.PrjScr   # Altium script project (expects Prj-Parameters.pas)
└── test.txt                # Example output
```

## Usage

1. Put `Prj-Parameters.pas` next to `Script_Project.PrjScr`.
2. In Altium Designer, open `Script_Project.PrjScr`.
3. Run it from **File » Run Script** and pick the procedure in `Prj-Parameters.pas`.

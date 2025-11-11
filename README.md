# Altium Project Parameters Automation Script

This repository provides a **Delphi (Pascal)** script for **Altium Designer** that automates the process of importing and managing **project-level parameters** from a `.txt` file.

---

## Features

- Automatically **adds or updates** project parameters in the focused Altium project.
- Supports importing from a simple `key;value` formatted `.txt` file.
- Displays feedback for each added or updated parameter.
- Easy to customize or extend.

---

## Requirements

- Altium Designer (tested with 20.x+)
- Script engine enabled (`.pas` scripting)
- Active, focused project in Altium

---

## Input Format

The input file should be a plain text file (`.txt`) with each line containing:


### Example:

Author;name 
ProjectName;STM32F373 Relay Control Board
Revision;1.1
Date;2025-05-13

---

## How to Use

1. Open **Altium Designer**.
2. Go to **DXP > Run Script**.
3. Load the `.pas` file provided in this repo.
4. When prompted, select your `.txt` file containing the parameters.
5. Script will:
   - Update existing parameters if value differs
   - Add new parameters if not found
6. You’ll see `ShowMessage` confirmations for each action.

---

## File Structure

AltiumProjectParamScript

    ├── prj.pas # Main script

    └── README.md # This file


---

## Customization Tips

- Increase array size if you expect more than 100 parameters.
- Replace `ShowMessage` with logging to a file or status panel.
- Add support for `.csv`, `.json`, or GUI dialogs if needed.


---
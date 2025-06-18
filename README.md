# Admin Menu System

A comprehensive Bash script for user and group management with an interactive menu interface.

## Features

- **User Management**:
  - Add new users with home directories
  - Delete existing users (including home directories)
  - Input validation for existing/non-existing users

- **Group Management**:
  - Create new groups
  - Delete existing groups
  - Rename groups with validation
  - Existence checks before operations
```bash
┌───────────────────────┐
│      Main Menu        │
├──────────┬────────────┤
│ 1) User  │ 2) Group   │
├──────────┴────────────┤
│       3) Exit         │
└───────────────────────┘
        ↓     ↓
┌───────────┐ ┌─────────────┐
│ User Menu │ │ Group Menu  │
├───────────┤ ├─────────────┤
│ 1) Add    │ │ 1) Add      │
│ 2) Delete │ │ 2) Delete   │
│ 3) Back   │ │ 3) Rename   │
└───────────┘ │ 4) Back     │
              └─────────────┘
```
---
## Requirements

- Linux system
- Bash shell
- Sudo/root privileges (for user/group modifications)
- Standard GNU utilities (id, useradd, userdel, groupadd, etc.)
---
## Installation
1. Download the script:
   ```bash
   wget https://example.com/path/to/admin_menu.sh
   ```
2. Make it executable:
```bash
   chmod +x admin_menu.sh
  ```
3. Run with:
```bash
sudo ./admin_menu.sh
```
---
## Usage
**Main Menu**
```bash
Hello To Admin Menu
1) User
2) Group
3) Exit
select your option:
```
**User Submenu**
```bash
Hello To User Menu
1) Add
2) Delete
3) Back
select your option:
```
**Group Submenu**
```bash
Hello To Group Menu
1) Add
2) Delete
3) Rename
4) Back
select your option:
```
---
## Functions

| Function       | Description                          | Parameters |
|----------------|--------------------------------------|------------|
| `add_user`     | Creates new user with home directory | None       |
| `delete_user`  | Removes user and home directory      | None       |
| `add_group`    | Creates new system group             | None       |
| `delete_group` | Removes existing group               | None       |
| `rename_group` | Renames an existing group            | None       |

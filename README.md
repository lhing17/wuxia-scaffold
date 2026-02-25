# War3 Wuxia Map Scaffold

A scaffold project for creating Wuxia (Chinese martial arts) themed maps in Warcraft III. This project provides basic Wuxia-themed assets (terrain textures, models, and doodads) and will include common code frameworks in the future.

## Project Overview

This is a complete scaffold for War3 map development with Wuxia theme. It includes:
- Basic terrain layout with Wuxia aesthetics
- Chinese-style decorative models and textures
- Pre-configured doodads and terrain
- Trigger system setup
- Tools configuration for map compilation

## Project Structure

```
wuxia-scaffold/
├── scaffold/                    # Main map scaffold directory
│   ├── map/                    # Core map files
│   │   ├── war3map.doo        # Doodad data
│   │   ├── war3map.j          # JASS script
│   │   ├── war3map.mmp        # Minimap file
│   │   ├── war3map.shd        # Shadow data
│   │   ├── war3map.w3c        # Camera data
│   │   ├── war3map.w3e        # Terrain data
│   │   ├── war3map.w3r        # Region data
│   │   ├── war3map.wpm        # Pathing data
│   │   └── war3mapUnits.doo   # Unit data
│   ├── resource/               # Game resources
│   │   ├── terrainart/        # Terrain textures (various themes)
│   │   ├── war3mapImported/   # Imported Wuxia models and textures
│   │   ├── Textures/          # Additional textures
│   │   └── a_DOOD1/           # Doodad textures
│   ├── table/                 # Configuration tables
│   │   ├── doodad.ini        # Doodad definitions (29,436 entries)
│   │   └── w3i.ini           # Map information configuration
│   ├── trigger/              # Trigger system
│   │   ├── code.txt         # Custom script input
│   │   ├── catalog.lml      # Trigger catalog
│   │   └── 1-欢迎使用世界编辑器/ # Welcome triggers (Chinese)
│   └── w3x2lni/             # Tool configuration
│       ├── locale/          # Localization
│       └── version/         # Version info
├── scripts/                 # Scripts directory
│   └── jass/main.j         # Main JASS script (currently empty)
├── scaffold.w3x            # Compiled War3 map file (29.7MB)
└── .gitignore             # Git ignore configuration
```

## Features

### 1. Wuxia-Themed Assets
- **Terrain Textures**: 178 BLP texture files across various themes:
  - Ashenvale, Barrens, Cityscape, Dalaran, Dungeon, Lordaeron Summer, Northrend, Ruins
- **Imported Models**: Chinese Wuxia-style models

### 2. Code Frameworks (Under Development)

## Getting Started

### Prerequisites
- War3 World Editor (recommended KKWE)
- Basic understanding of War3 map development
- Git for version control (optional)

### Development Workflow
1. **Copy scaffold directory**: Copy the `scaffold/` directory to your project directory, rename the directory to your map name.
2. **Convert map to w3x file**: Use the w3x2lni tool to convert your map to a w3x file.
3. **Start editing**: Open your map file in your preferred map editor. You can use KKWE (recommended) or other map editors.

## Resource Usage Guidelines

### Terrain Textures
Terrain textures are organized by theme in `scaffold/resource/terrainart/`. Use appropriate textures for different map areas:
- `ashenvale/`: Forest and mystical areas
- `cityscape/`: Urban and architectural areas
- `northrend/`: Snowy and mountainous regions
- `ruins/`: Ancient and abandoned structures

### Wuxia Models
All imported models are in `scaffold/resource/war3mapImported/`. Key categories:
- **Architecture**: Temples, houses, walls, gates
- **Decorations**: Lanterns, stones, vegetation
- **Environmental**: Cart tracks, ruins, natural elements

### Doodad Configuration
Doodad properties are defined in `scaffold/table/doodad.ini`. Each entry includes:
- Model path reference
- Scaling factors
- Pathing properties
- Selection size and flags


## Future Development

This scaffold will be expanded with:
1. **Common Code Frameworks**: Reusable trigger systems and script libraries
2. **Template Systems**: Pre-built map templates for different game modes
3. **Documentation**: Detailed development guides and API references
4. **Tool Integration**: Improved development toolchain and automation

## Contributing
- Additional Wuxia-themed models, textures, terrain textures, and other assets
- Code frameworks and libraries
- Documentation and examples
- Bug fixes and improvements

## License

MIT

## Contact

- QQ: 496179067
- Email: lhing17@163.com


## Language Versions

This document is also available in [Chinese (中文)](README_zh.md).
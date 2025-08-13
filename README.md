# eczgenerator

> **Automated code & resource generator for Next.js + TypeScript projects**  
> Generate pages, API actions, types, sample data, mock APIs, routes, hooks, and UML diagrams from your Swagger/OpenAPI definitions.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![OpenAPI](https://img.shields.io/badge/OpenAPI-3.0-green.svg)](https://swagger.io/specification/)

## 🎯 Project Overview

**eczgenerator** is a powerful CLI tool that automates the generation of Next.js application components from OpenAPI/Swagger specifications. It eliminates the repetitive task of manually creating types, pages, API actions, and other boilerplate code, allowing developers to focus on building features rather than scaffolding.

### 🚀 Key Benefits

- **Time-saving**: Generate weeks of boilerplate code in minutes
- **Type-safe**: Automatic Zod schema and TypeScript interface generation
- **Consistent**: Maintains consistent code patterns across your project
- **Flexible**: Supports both YAML and JSON OpenAPI specifications
- **Extensible**: Easy to customize templates and add new generators

## ✨ Features

### Core Generation
- **🔄 Swagger/OpenAPI to Zod & TypeScript**
  - Generate Zod schema types from OpenAPI specifications
  - Auto-generate TypeScript interfaces with proper typing
  - Support for complex nested schemas and arrays

- **📊 Sample Data with Faker**
  - Create realistic sample objects from OpenAPI schemas
  - Configurable data generation for testing and development

- **⚡ API Actions**
  - Generate ready-to-use API call functions
  - Built-in error handling and type safety
  - Support for different HTTP methods and authentication

- **🎭 Mock API Creation**
  - Create mock API endpoints for testing and development
  - Realistic response generation based on schema definitions

### UI & Navigation
- **🧭 Sidebar Routes**
  - Auto-generate sidebar navigation items
  - Hierarchical menu structure based on API endpoints

- **📄 Pages**
  - Quickly scaffold new Next.js pages from API definitions
  - Pre-configured with proper routing and layouts

- **🎣 Custom Hooks**
  - Type-safe, reusable hooks with generics
  - Built-in state management and API integration

- **📋 Table Columns**
  - Generate table column configs for data grids
  - Responsive design considerations

### Documentation & Visualization
- **📈 UML Diagrams**
  - Generate PlantUML diagrams from API models
  - Visual representation of data relationships
  - Export to multiple formats (PNG, SVG, PDF)

## 🛠️ Dependencies

### Required Tools
- **Bash** (4.0+) - Shell scripting environment
- **jq** (1.6+) - Command-line JSON processor
- **yq** (4.0+) - Command-line YAML processor

### Installation

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install jq
sudo snap install yq
```

#### macOS
```bash
brew install jq yq
```

#### Arch Linux
```bash
sudo pacman -S jq yq
```

#### Windows (WSL)
```bash
# Install WSL first, then follow Ubuntu instructions above
```

## 📦 Installation

### Clone the Repository
```bash
git clone https://github.com/eczdell/eczgenerator.git
cd eczgenerator
```

### Set Permissions
```bash
chmod +x ./script/*.sh
```

### Verify Installation
```bash
./script/index.sh --help
```

## 🚀 Usage

### Quick Start

1. **Prepare Your OpenAPI Specification**
   ```bash
   # If you have a YAML file, convert to JSON
   yq -o=json openapi.yaml > openapi.json
   
   # Or use your existing JSON file
   cp your-api-spec.json openapi.json
   ```

2. **Run the Generator**
   ```bash
   ./script/index.sh
   ```

3. **Review Generated Output**
   - `/types` → Zod schemas & TypeScript interfaces
   - `/pages` → Next.js pages with routing
   - `/hooks` → Custom React hooks
   - `/actions` → API action functions
   - `/mock` → Mock API endpoints
   - `/columns` → Table column configurations
   - `/uml` → PlantUML diagrams

### Advanced Usage

#### Generate Specific Components
```bash
# Generate only types
./script/generateTypes.sh

# Generate only pages
./script/generatePage.sh

# Generate only table columns
./script/generateColumns.sh
```

#### Custom Configuration
```bash
# Set custom output directory
export OUTPUT_DIR="./src/generated"

# Set custom template directory
export TEMPLATE_DIR="./custom-templates"

./script/index.sh
```

### Workflow Examples

#### From Postman Collection
1. Export your Postman collection
2. Convert to OpenAPI using [p2o.defcon007.com](https://p2o.defcon007.com/)
3. Convert YAML to JSON: `yq -o=json postman-openapi.yaml > openapi.json`
4. Run generator: `./script/index.sh`

#### From Swagger UI
1. Export OpenAPI specification from Swagger UI
2. Ensure it's in JSON format
3. Run generator: `./script/index.sh`

## 📁 Project Structure

```
eczgenerator/
├── script/                    # Generation scripts
│   ├── index.sh             # Main orchestrator
│   ├── generateTypes.sh     # Type generation
│   ├── generatePage.sh      # Page generation
│   ├── generateColumns.sh   # Table column generation
│   ├── generateActions.sh   # API action generation
│   ├── generateFaker.sh     # Sample data generation
│   ├── generateSidebarRoutes.sh # Navigation generation
│   └── back/                # Backend-specific generators
├── templates/                # Code templates
│   ├── type.txt            # Type template
│   ├── page.txt            # Page template
│   ├── action.txt          # Action template
│   ├── columns.txt         # Column template
│   └── sidebarRoutes.txt   # Navigation template
├── jq/                     # jq processing scripts
├── sample.json             # Example OpenAPI specification
├── sample.yml              # Example OpenAPI specification (YAML)
├── policy.json             # Project configuration
└── README.md               # This file
```

## 🎨 Customization

### Templates
All templates are located in the `templates/` directory and can be customized to match your project's coding standards and preferences.

### Configuration
Modify `policy.json` to customize generation behavior, output paths, and template variables.

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### Development Setup
1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/eczgenerator.git`
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Make your changes
5. Test thoroughly: `./script/index.sh`
6. Commit with conventional commits: `git commit -m "feat: add amazing feature"`
7. Push to your branch: `git push origin feature/amazing-feature`
8. Open a Pull Request

### Contribution Guidelines
- Follow the existing code style and structure
- Add tests for new features
- Update documentation for any changes
- Use conventional commit messages
- Ensure all scripts are executable and tested

### Areas for Contribution
- New generator types
- Template improvements
- Documentation enhancements
- Bug fixes and performance improvements
- Additional OpenAPI specification support

## 🐛 Troubleshooting

### Common Issues

#### Permission Denied
```bash
chmod +x ./script/*.sh
```

#### jq/yq Not Found
```bash
# Install missing dependencies (see Dependencies section)
which jq yq
```

#### Template Errors
```bash
# Check template syntax
cat templates/*.txt

# Verify template variables
./script/generateTypes.sh --debug
```

### Getting Help
- Check the [Issues](https://github.com/eczdell/eczgenerator/issues) page
- Create a new issue with detailed error information
- Include your OpenAPI specification (sanitized if needed)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OpenAPI Initiative](https://www.openapis.org/) for the specification standard
- [jq](https://stedolan.github.io/jq/) for JSON processing
- [yq](https://github.com/mikefarah/yq) for YAML processing
- [Next.js](https://nextjs.org/) for the React framework
- [Zod](https://zod.dev/) for runtime type validation

## 📊 Project Status

- **Version**: 1.0.0
- **Status**: Active Development
- **Maintainer**: [eczdell](https://github.com/eczdell)
- **Last Updated**: December 2024

---

**Made with ❤️ by the eczgenerator community**

If this project helps you, please consider giving it a ⭐️ star on GitHub!



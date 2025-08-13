# eczgenerator

**Automated code & resource generator for Next.js + TypeScript projects**  
Generate pages, API actions, types, sample data, mock APIs, routes, hooks, and even UML diagrams — all from your Swagger/OpenAPI definitions.

---

## ✨ Features

- **Swagger/OpenAPI to Zod & TypeScript**
  - Generate Zod schema types from Swagger/OpenAPI.
  - Auto-generate TypeScript interfaces.
- **Sample Data with Faker**
  - Create realistic sample objects from Swagger schemas.
- **API Actions**
  - Generate ready-to-use API call functions.
- **Mock API Creation**
  - Create mock API endpoints for testing.
- **Sidebar Routes**
  - Auto-generate sidebar navigation items.
- **Pages**
  - Quickly scaffold new pages from API definitions.
- **Custom Hooks (Generic)**
  - Type-safe, reusable hooks with generics.
- **Table Columns**
  - Generate table column configs for data grids.
- **UML Diagram**
  - Generate PlantUML diagrams from API models.
- **CLI Script Automation**
  - One command runs all your generation steps.

---

## 📦 Installation

```bash
git clone https://github.com/eczdell/eczgenerator.git
cd eczgenerator
chmod +x ./script/*.sh
🚀 Usage
Run the main script:

./script/index.sh
This will sequentially run:

generateColumns.sh

generatePage.sh

generateTypes.sh

🔗 Integrations
jq and yq
Convert YAML ↔ JSON.

Filter and transform data directly in the CLI.

Example: Convert OpenAPI YAML to JSON:

yq -o=json openapi.yaml
Postman → OpenAPI
Convert Postman collection exports to OpenAPI YAML:

https://p2o.defcon007.com/

📂 Project Structure
script/
 ├── generateColumns.sh   # Generates table column configs
 ├── generatePage.sh      # Creates Next.js pages
 ├── generateTypes.sh     # Creates Zod + TS interfaces
 └── index.sh             # Runs all scripts in sequence
🛠 Example Workflow
Export your API definition from Swagger/Postman.

(Optional) Convert Postman → OpenAPI YAML using the link above.

Use yq to convert YAML → JSON if needed.

Place the OpenAPI spec in your project.

Run:

./script/index.sh
Generated output:

/types → Zod schemas & interfaces

/pages → Next.js pages

/hooks → Custom hooks

/mock → Mock APIs

/columns → Table configs

/uml → UML diagrams

🖼 Example UML Output
plantuml
@startuml
entity User {
  *id : number
  *name : string
  *email : string
}
@enduml
🤝 Contributing
Fork the repo

Create a new branch:

git checkout -b feature/my-feature
Commit changes:

git commit -m "feat: add my feature"
Push and create a PR.

📜 License
MIT © Sabin Silwal



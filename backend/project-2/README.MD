### Requirements:
- NodeJS v20
- npm, pnpm or yarn

### How to run locally:
- Clone the repository: `git clone [repo-name]`
- Install all dependencies: `npm install`, `pnpm install` or `yarn install`
- Run development server: `npm run dev`, `pnpm dev` or `yarn dev`
- Open your browser and go to: http://localhost:3000/api/v1

```bash
├── src
│   ├── controllers
│   │   ├── maitenance-info.ts
│   │   └── ...
│   ├── routes
│   │   ├── contact-info.ts
│   │   └── ...
│   ├── services
│   │   ├── service-category.ts
│   │   └── ...
│   ├── types
│   │   ├── history-image.ts
│   │   └── ...
│   ├── app.ts
│   └── swagger.ts
|
├── node_modules
├── .nvmrc
├── package.json
├── README.md
└── tsconfig.json
```
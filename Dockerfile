FROM node:26-slim
WORKDIR /app
RUN apt-get update && apt-get install -y python3 make g++ git && rm -rf /var/lib/apt/lists/*
RUN npm install -g pnpm
COPY . .
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pnpm install && pnpm build
ENV OPENROUTER_API_KEY=""
ENV TELEGRAM_BOT_TOKEN=""
EXPOSE 8081
CMD ["pnpm", "start"]

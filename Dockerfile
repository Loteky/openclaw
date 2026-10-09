FROM node:26-alpine
WORKDIR /app
RUN apk add --no-cache python3 make g++
RUN npm install -g pnpm
COPY . .
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pnpm install && pnpm build
ENV OPENROUTER_API_KEY=""
ENV TELEGRAM_BOT_TOKEN=""
EXPOSE 8081
CMD ["pnpm", "start"]

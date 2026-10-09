FROM node:26-alpine
WORKDIR /app
COPY package*.json pnpm-lock.yaml* ./
RUN npm install -g pnpm && pnpm install --prod
COPY . .
ENV OPENROUTER_API_KEY=""
ENV TELEGRAM_BOT_TOKEN=""
EXPOSE 8081
CMD ["pnpm", "start"]

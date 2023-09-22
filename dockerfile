From mcr.microsoft.com/playwright:v1.37.1-jammy 
ADD . /app
WORKDIR /app
RUN npm install
CMD npx playwright test
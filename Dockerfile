# Step 1: Build the codelab using Go and Claat
FROM golang:1.21-alpine AS builder

# Install git (required for go install)
RUN apk add --no-cache git

# Install claat
RUN go install github.com/googlecodelabs/tools/claat@latest

WORKDIR /app
COPY . .

# Export the codelab (outputs to a folder named 'git-github-fundamentals')
RUN /go/bin/claat export git-github-codelab.md

# Step 2: Serve the static files using Nginx
FROM nginx:alpine

# Copy the exported content to the default Nginx public directory
# Note: We copy the *contents* of the generated folder to the root
COPY --from=builder /app/git-github-fundamentals /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

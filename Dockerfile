# Step 1: Build the codelab using Go and Claat
# Using Debian-based image for better compatibility and pre-installed certificates
FROM golang:1.23-bookworm AS builder

# Set CGO_ENABLED=0 to build a purely static binary
ENV CGO_ENABLED=0

# Install claat
RUN go install github.com/googlecodelabs/tools/claat@latest

WORKDIR /app
COPY . .

# Export the codelab (outputs to a folder named 'git-github-fundamentals')
# We use the full path to the binary in the golang image
RUN /go/bin/claat export git-github-codelab.md

# Step 2: Serve the static files using Nginx
FROM nginx:stable-alpine

# Copy the exported content to the default Nginx public directory
COPY --from=builder /app/git-github-hackathon-codelab /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

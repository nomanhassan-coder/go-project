# Use official Go image
FROM golang:1.21-alpine

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy all source files
COPY . .

# Build Go binary
RUN go build -o google_trends_app main.go

# Expose port (adjust if needed)
EXPOSE 8080

# Run the binary
CMD ["./google_trends_app"]

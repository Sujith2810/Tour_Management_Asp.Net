# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src

# Copy project file and restore dependencies
COPY Tour_Management.csproj ./
RUN dotnet restore

# Copy all source files
COPY . ./

# Build the project
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

WORKDIR /app

# Copy published files from build stage
COPY --from=build /app/publish .

# Expose port
EXPOSE 80

# Set entry point
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

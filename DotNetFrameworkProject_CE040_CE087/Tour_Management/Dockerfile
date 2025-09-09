# Base runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy only the csproj file first (for better caching)
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management/Tour_Management.csproj ./Tour_Management/
RUN dotnet restore ./Tour_Management/Tour_Management.csproj

# Copy everything else
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management ./Tour_Management
WORKDIR /src/Tour_Management
RUN dotnet build -c Release -o /app/build

# Publish
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish

# Final runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

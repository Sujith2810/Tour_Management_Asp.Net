# Build Stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy csproj and restore dependencies
COPY Tour_Management.csproj ./
RUN dotnet restore Tour_Management.csproj

# Copy everything else and build
COPY . .
RUN dotnet publish Tour_Management.csproj -c Release -o /app/publish

# Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

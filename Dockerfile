# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management/Tour_Management.csproj ./Tour_Management/
RUN dotnet restore ./Tour_Management/Tour_Management.csproj

# Copy everything else and build
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management ./Tour_Management
WORKDIR /src/Tour_Management
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

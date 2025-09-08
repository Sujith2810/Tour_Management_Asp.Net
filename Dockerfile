# Use the official .NET SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src

# Copy the project file and restore dependencies
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management/Tour_Management.csproj ./Tour_Management/
RUN dotnet restore ./Tour_Management/Tour_Management.csproj
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management ./Tour_Management


# Copy the rest of the source code
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management ./Tour_Management

WORKDIR /src/Tour_Management

# Build and publish the project
RUN dotnet publish -c Release -o /app/publish

# Use the official .NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

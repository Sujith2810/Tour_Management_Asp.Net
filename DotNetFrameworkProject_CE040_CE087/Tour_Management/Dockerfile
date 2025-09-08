# Use the official .NET 6 ASP.NET runtime image (Linux)
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build/publish the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy project files
COPY ["Tour_Management.csproj", "./"]
# Restore dependencies
RUN dotnet restore "./Tour_Management.csproj"

# Copy the rest of the source code
COPY . .
# Build and publish the app
RUN dotnet publish "Tour_Management.csproj" -c Release -o /app/publish

# Copy published files to runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

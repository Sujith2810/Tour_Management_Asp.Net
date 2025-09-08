# Base runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy csproj and restore
COPY ./Tour_Management/Tour_Management.csproj ./
RUN dotnet restore

# Copy the rest of the code
COPY ./Tour_Management/. ./

# Build and publish
RUN dotnet publish -c Release -o /app/publish

# Copy published files to runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Tour_Management.dll"]

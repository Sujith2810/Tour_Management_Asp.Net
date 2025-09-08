# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy only the project file first (improves caching)
COPY Tour_Management_AspNet/Tour_ManagementCore.csproj ./Tour_ManagementCore.csproj
RUN dotnet restore Tour_ManagementCore.csproj

# Copy the rest of the source code
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TourManagementCore.dll"]

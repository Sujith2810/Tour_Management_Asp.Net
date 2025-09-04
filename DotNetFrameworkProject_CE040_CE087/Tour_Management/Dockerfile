# Use Windows Server Core with IIS
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set working directory
WORKDIR /inetpub/wwwroot

# Copy project to container
COPY . .

# Expose IIS port
EXPOSE 80

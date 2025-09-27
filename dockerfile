# ---------- Stage 1: Build ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copiar configuraciones de NuGet y CPM primero
COPY src/nuget.config .
COPY src/Directory.Packages.props .

# Copiar solución y proyectos (.csproj) para cache eficiente
COPY src/ENTRYPOINT.sln .
COPY src/XXX/*.csproj ./XXX/

# Restaurar dependencias
RUN dotnet restore ./ENTRYPOINT/ENTRYPOINT.csproj

# Copiar el código completo
COPY src/XXX ./XXX

# Publicar la app
WORKDIR /src/ENTRYPOINT
RUN dotnet publish -c Release -o /app/publish

# ---------- Stage 2: Runtime ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "ENTRYPOINT.dll"]

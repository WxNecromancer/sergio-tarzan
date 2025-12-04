# Etapa 1:
FROM gcc:12 AS builder
WORKDIR /app
COPY main.cpp .
RUN g++ -o my_app main.cpp -static

# Etapa 2:
FROM scratch
COPY --from=builder /app/my_app /my_app
CMD ["/my_app"]

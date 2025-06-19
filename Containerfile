FROM registry.access.redhat.com/ubi9/openjdk-21 AS builder
COPY . .
RUN mvn package

FROM registry.access.redhat.com/ubi9/openjdk-21-runtime
COPY --from=builder /home/default/target/helloworld-1.1.jar .
ENTRYPOINT java -cp helloworld-1.1.jar com.coveros.demo.helloworld.HelloWorld

FROM ubuntu:22.04

ARG RUNNER_VERSION=2.321.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    jq \
    libicu70 \
    libssl3 \
    unzip \
    zip \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/runner runner

WORKDIR /home/runner

RUN curl -fsSL "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" \
    | tar xz \
  && ./bin/installdependencies.sh \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN chown -R runner:runner /home/runner

USER runner

ENTRYPOINT ["./entrypoint.sh"]

FROM ghcr.io/foundry-rs/foundry:latest

# PORT: The port to listen on
ARG PORT
ENV PORT=${PORT:-"8545"}
EXPOSE $PORT

# Anvil options
ARG FORK_URL
ENV FORK_URL=${FORK_URL:-"https://polygon-rpc.com"}
ARG BLOCK_TIME
ENV BLOCK_TIME=${BLOCK_TIME:-"3"}
ARG FORK_BLOCK_NUMBER
ENV FORK_BLOCK_NUMBER=${FORK_BLOCK_NUMBER:-"45456965"}

ENTRYPOINT anvil --host 0.0.0.0 -p $PORT --fork-url $FORK_URL -b $BLOCK_TIME  --fork-block-number $FORK_BLOCK_NUMBER --auto-impersonate
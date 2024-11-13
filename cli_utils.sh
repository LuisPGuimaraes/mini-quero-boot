#!/bin/bash

# Alias to docker-compose
# Usage: dc <docker-compose command>
# Example: dc logs -f my-service
alias dc="docker-compose"

# Run service with the given command
# Usage: dcrun <service> <command>
alias dcrun="dc run --rm"

# Run service with the given command publishing service ports on the host
# Usage: drports <service> <command>
alias dcports="dcrun --service-ports"

# Start service attached to the current console session
# Usage: dup <service>
function dcup() {
  SERVICE="$1"

  dc stop "$SERVICE" && dc up "$SERVICE"
}

# Start service detached
# Usage: dstart <service>
function dcstart() {
  SERVICE="$1"

  dc stop "$SERVICE" && dc up -d "$SERVICE"
}


## queropago specific commands

# Run queropago container with the given command
# Usage: qp <command>
# Examples:
#   - qp sidekiq
#   - qp sh
#   - qp bundle
#   - qp rails c
alias qp="dcrun queropago"

# Run queropago rails server binding service ports to host
alias qpserver="dcports queropago"


## adam specific commands

# Run adam container with the given command
# Usage: adam <command>
# Examples:
#   - adam sh
#   - adam yarn
#   - adam yarn orm
alias adam="dcrun adam"

# Run adam development server binding service ports to host
alias adamserver="dcports adam"

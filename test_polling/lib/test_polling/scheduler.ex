defmodule TestPolling.Scheduler do
  use Quantum.Scheduler,
    otp_app: :test_polling
  @moduledoc false

  #what we did: add quantum deps
  #add to supervision tree in TestPolling.Application

  # For real app: determine rate limit

  # see docs for scheduling
  


end

defmodule Wizard.Cons.Register do
  @moduledoc """
  Registration functions for the wizard convention.
  """
  alias Wizard.Cons.Guest
  alias Wizard.Cons.EventSchedule, as: Schedule

  @doc """
  Register a new guest and display the schedule.
  """
  def new(name, specialty \\ "Curiousity") do
    Guest.new(name)
    |> Guest.add_specialty(specialty)
    |> Schedule.add()
    |> display()
  end

  defp display(guest) do
    IO.puts "#{guest.name}: Master of #{guest.specialty}"
    for event <- guest.events, do: IO.puts event
    "Let the magic begin!"
  end
end

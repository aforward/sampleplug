defmodule Sampleplug.Action do
  use Ecto.Schema
  import Ecto.Changeset

  schema "actions" do
    field :name, :string
    field :entity_type, :string
    field :entity_id, :string
    field :data, :map

    timestamps
  end

  def changeset(record, params \\ :empty) do
    record
    |> cast(params, [:name, :entity_type, :entity_id, :data])
    |> validate_required([:name, :entity_type, :entity_id])
  end
end
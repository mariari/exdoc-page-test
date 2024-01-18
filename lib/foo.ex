defmodule Foo do
  @moduledoc """
  Documentation for `Test`.

  ```mermaid
  graph BT
      C(Client #3) ~~~ B(Client #2) ~~~ A(Client #1)
      A & B & C -->|request| GenServer
      GenServer -.->|reply| A & B & C
  ```

  """

  @doc """
  Hello world.

  ## Examples

      iex> Foo.hello()
      :world

  ```mermaid
  %%{init:
  { 'logLevel': 'debug',
  'theme': 'forest',
  'gitGraph': {'showBranches': true,
               'showCommitLabel':true,
               'mainBranchName': 'base'}} }%%
  gitGraph TB:
  commit id: "73bfd7d" tag: "v0.3.0"
  branch main
  branch ray/mnesia-attach
  commit id: "97bef7"
  checkout main
  merge ray/mnesia-attach id: "13b3e4a"


  checkout base
  branch proper-topic
  commit id: "8087564: add a new feature"

  checkout main
  branch topic-x
  commit id: "bc4b2a1: new cool feature"

  checkout main
  merge proper-topic id: "2dd991a"

  checkout main
  branch topic-y
  commit id: "546a8f9: add feature: conflicts X!"

  checkout main
  merge topic-x id: "90d91e7"
  merge topic-y id: "0438922"
  ```


  """
  def hello do
    :world
  end
end

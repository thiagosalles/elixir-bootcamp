# elixir-bootcamp
Code from The Complete Elixir and Phoenix Bootcamp - Udemy

Although the course uses Elixir 1.3, I decided to use the most recent version of Elixir and Erlang available, respecting the compatibility described on [elixir documentation](https://hexdocs.pm/elixir/master/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp) and upgrading the code as needed.

The original repo is https://github.com/StephenGrider/ElixirCode

I'll keep steps here organized by [tags](https://github.com/thiagosalles/elixir-bootcamp/tags). If I ever need to work on a previous version of the code, I'll create a branch from the tag, work on it, update the tag and then delete the branch.

## Dependencies

The tools needed can be installed using [asdf](https://github.com/asdf-vm/asdf)

You can install it on Mac using [homebrew](https://brew.sh/):
```
brew install asdf
```

You'll need additional plugins to install the tools. Download it using the following commands:
```
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
```

After that, just the following commands to install tools and dependencies:
```
asdf install
iex get.deps
```

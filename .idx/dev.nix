# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{pkgs}: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.nodePackages.pnpm
    pkgs.bun
    pkgs.python3
    pkgs.mongodb
    pkgs.mongosh 
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [ "ms-python.python" "rangav.vscode-thunder-client" ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
        install =
          # "";
          "python -m venv .venv && source .venv/bin/activate && pip install -r kanban-be/requirements.txt";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [
          # Cover all the variations of language, src-dir, router (app/pages)
          "app/page.tsx" "app/page.jsx"
        ];
      };
      # Runs when a workspace is (re)started
      onStart = { 
        # run-server = "./app/main.py"; 
        install = 
          "";
          mongo-db = "chmod +x ./mongodb/start.sh && ./mongodb/start.sh"; 
      };
    };
    # Enable previews and customize configuration
    # previews = {
    #   enable = true;
    #   previews = {
    #     web = {
    #       command = ["npm" "run" "dev" "--" "--port" "$PORT" "--hostname" "0.0.0.0"];
    #       manager = "web";
    #     };
    #   };
    # };
  };
}
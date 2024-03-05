{...}:
{
  programs.git = {
    enable = true;
    userName = "Robert Rainthorpe";
    userEmail = "rob.rainthorpe@me.com";
    ignores = [ ".CFUserTextEncoding" ".DS_Store" ".Trash/" "*.swp" ];
    extraConfig = {
      pull = {
        rebase = true;
      };
    };

    difftastic = {
      enable = true;
      background = "dark";
    };

#    delta = {
#      enable = true;
#    };

    aliases = {
      st = "status";
      ci = "commit";
      co = "checkout";
      di = "diff";
      dc = "diff --cached";
      amend = "commit --amend";
      aa = "add --all";
      ff = "merge --ff-only";
      pullff = "pull --ff-only";
      noff = "merge --no-ff";
      fa = "fetch --all";
      pom = "push origin master";
      b = "branch";
      ds = "diff --stat=160,120";
      dh1 = "diff HEAD~1";
      div = "divergence";
      head = "!git l -1";
      h = "!git head";
      r = "!git l -30";
      ra = "!git r --all";
      la = "!git l --all";
    };
  };
}

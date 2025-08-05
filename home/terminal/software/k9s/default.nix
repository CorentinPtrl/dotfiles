{ config
, pkgs
, ...
}: {
 programs.k9s = {
    enable = true;
    settings.k9s = {
      ui = {
        headless = true;
        logoless = true;
        noIcons = true;
        skin = "transparent";
      };
      skipLatestRevCheck = true;
    };

    skins = {
      transparent = ./transparent.yaml;
    };

    views = {
      "v1/nodes" = {
        sortColumn = "NODEGROUP:asc";
        columns = [
          "NAME"
          "STATUS"
          "ROLES"
          "AGE"
          "VERSION"
          "ARCHI:.metadata.labels.kubernetes\\.io/arch"
          "ROLE:.metadata.labels.role"
          "NODEGROUP:.metadata.labels.eks\\.amazonaws\\.com/nodegroup"
          "INSTANCE_TYPE:.metadata.labels.node\\.kubernetes\\.io/instance-type"
          "CAPACITY_TYPE:.metadata.labels.karpenter\\.sh/capacity-type"
          "PODS"
          "%CPU"
          "%MEM"
        ];
      };
    };

    plugin.plugin = {
      modify-secret = {
        shortCut = "Ctrl-X";
        description = "Edit Decoded Secret";
        confirm = false;
        scopes = [ "secrets" ];
        command = "kubectl";
        background = false;
        args = [
          "modify-secret"
          "--context"
          "$CONTEXT"
          "--namespace"
          "$NAMESPACE"
          "$NAME"
        ];
      };

      fblog-pod = {
        shortCut = "Shift-L";
        confirm = false;
        description = "fblog";
        scopes = [ "pods" ];
        command = "sh";
        background = false;
        args = [ "-c" "kubectl logs --follow -n $NAMESPACE $NAME | fblog" ];
      };

      fblog-container = {
        shortCut = "Shift-L";
        confirm = false;
        description = "fblog";
        scopes = [ "containers" ];
        command = "sh";
        background = false;
        args = [ "-c" "kubectl logs --follow -n $NAMESPACE $POD -c $NAME | fblog" ];
      };

      fblog-pod-all = {
        shortCut = "Shift-K";
        confirm = false;
        description = "fblog -d";
        scopes = [ "pods" ];
        command = "sh";
        background = false;
        args = [ "-c" "kubectl logs --follow -n $NAMESPACE $NAME | fblog -d" ];
      };

      fblog-container-all = {
        shortCut = "Shift-K";
        confirm = false;
        description = "fblog -d";
        scopes = [ "containers" ];
        command = "sh";
        background = false;
        args = [ "-c" "kubectl logs --follow -n $NAMESPACE $POD -c $NAME | fblog -d" ];
      };
    };
  };
}

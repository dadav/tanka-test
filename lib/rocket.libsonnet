local tanka = import 'github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet';
local helm = tanka.helm.new(std.thisFile);

local newRocketChat(name, ns) = tanka.k8s.patchKubernetesObjects(helm.template(name, '../charts/rocketchat', {
  namespace: ns,
  values: {
    mongodb: {
      auth: {
        passwords: ['rocketchat'],
        rootPassword: 'rocketchatroot',
      },
    },
  },
}), {
  metadata+: {
    namespace: ns,
  },
});

{
  newRocketChat:: newRocketChat,
}

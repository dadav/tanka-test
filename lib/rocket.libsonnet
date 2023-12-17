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
    extraEnv: [
      { name: 'INITIAL_USER', value: 'yes' },
      { name: 'ADMIN_USERNAME', value: 'admin' },
      { name: 'ADMIN_NAME', value: 'admin' },
      { name: 'ADMIN_PASS', value: 'admin' },
      { name: 'ADMIN_EMAIL', value: 'admin@localhost' },
    ],
  },
}), {
  metadata+: {
    namespace: ns,
  },
});

{
  newRocketChat:: newRocketChat,
}

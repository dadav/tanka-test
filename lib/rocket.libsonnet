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
    extraEnv: {
      INITIAL_USER: 'yes',
      ADMIN_USERNAME: 'admin',
      ADMIN_NAME: 'admin',
      ADMIN_PASS: 'admin',
      ADMIN_EMAIL: 'admin@localhost',
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

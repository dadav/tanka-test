local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';
local rocket = import 'rocket.libsonnet';

{
  local ns = 'foo',
  rocketchatInstance: rocket.newRocketChat('kakakakaka', ns),
}

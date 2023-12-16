local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';
local rocket = import 'rocket.libsonnet';

{
  local ns = 'foo',
  deploy_ns: k.core.v1.namespace.new(ns),
  rocketchatInstance: rocket.newRocketChat('bar', ns),
}

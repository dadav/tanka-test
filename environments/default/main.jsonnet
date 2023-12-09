local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';
{
  test_ns: k.core.v1.namespace.new('foo'),
}

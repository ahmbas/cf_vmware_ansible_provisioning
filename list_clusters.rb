dialog_field = $evm.object
dialog_field['sort_by'] = 'description'
dialog_field['sort_order'] = 'ascending'
dialog_field['data_type'] = 'string'

dialog_field['required'] = true
dialog_field['values'] = nil

clusters_hash = {}

provider = $evm.root['dialog_param_provider']


provider = $evm.vmdb('EmsInfra').find_by_name(provider)
$evm.vmdb('EmsCluster').where(:ems_id => provider.id).each do |cluster|
clusters_hash[cluster.name] = cluster.name
end

$evm.log("info","Cluster choices are is #{clusters_hash}]")
dialog_field['values'] = clusters_hash

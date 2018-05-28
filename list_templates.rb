dialog_field = $evm.object
dialog_field['sort_by'] = 'description'
dialog_field['sort_order'] = 'ascending'
dialog_field['data_type'] = 'string'

dialog_field['required'] = true
dialog_field['values'] = nil

templates_hash = {}


def get_cluster(cluster)
    cluster = JSON.parse(cluster)
    return cluster
  rescue JSON::ParserError => e
    return cluster
end


cluster = get_cluster($evm.root['dialog_param_cluster'])

evm_cluster = $evm.vmdb('ems_cluster').find_by_name(cluster)
$evm.vmdb("vm_or_template").where(:ems_cluster_id => evm_cluster.id, :template => true).each do |template|
templates_hash[template.name] = template.name
end


dialog_field['values'] = templates_hash

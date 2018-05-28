dialog_field = $evm.object
dialog_field['sort_by'] = 'description'
dialog_field['sort_order'] = 'ascending'
dialog_field['data_type'] = 'string'

dialog_field['required'] = true
dialog_field['values'] = nil

storages_hash = {}


def get_cluster(cluster)
    cluster = JSON.parse(cluster)
    return cluster
  rescue JSON::ParserError => e
    return cluster
end


cluster = get_cluster($evm.root['dialog_param_cluster'])

evm_cluster = $evm.vmdb('ems_cluster').find_by_name(cluster)
evm_cluster.storages.each do |storage|
storages_hash[storage.name] = storage.name
end


dialog_field['values'] = storages_hash

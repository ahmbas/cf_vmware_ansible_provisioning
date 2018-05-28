dialog_field = $evm.object
dialog_field['sort_by'] = 'description'
dialog_field['sort_order'] = 'ascending'
dialog_field['data_type'] = 'string'

dialog_field['required'] = true
dialog_field['values'] = nil

providers_hash = {}

cluster = $evm.root['dialog_param_cluster']

$evm.vmdb('EmsInfra').all().each do |provider|
providers_hash[provider.name] = provider.name
end


dialog_field['values'] = providers_hash

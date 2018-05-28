dialog_field = $evm.object
dialog_field['sort_by'] = 'description'
dialog_field['sort_order'] = 'ascending'
dialog_field['data_type'] = 'string'

dialog_field['required'] = true
dialog_field['values'] = nil

datacenters_hash = {}

provider = $evm.root['dialog_param_provider']


provider = $evm.vmdb('EmsInfra').find_by_name(provider)
$evm.vmdb('EmsFolder').where(:ems_id => provider.id).each do |datacenter|
if datacenter.type == "Datacenter"
  datacenters_hash[datacenter.name] = datacenter.name
end
end


dialog_field['values'] = datacenters_hash

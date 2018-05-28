###################################
#
# EVM Automate Method: ListVLan
#
# Notes: This method is used to retrieve the VLAN List
begin
$evm.log("info","Provider selected is #{$evm.root["dialog_param_provider"]}]")
 dialog_field = $evm.object
 dialog_field['sort_by'] = 'description'
 dialog_field['sort_order'] = 'ascending'
 dialog_field['data_type'] = 'string'

 dialog_field['required'] = true
 dialog_field['values'] = nil

 vlan_hash = Hash.new()

#evm_cluster = $evm.vmdb('ems_cluster').find(:first, :conditions => ["id = ?",cluster])

#cluster = JSON.parse($evm.root['dialog_param_cluster']).first().first()
#cluster = JSON.parse($evm.root['dialog_param_cluster'])

def get_cluster(cluster)
    cluster = JSON.parse(cluster)
    return cluster
  rescue JSON::ParserError => e
    return cluster
end

cluster = get_cluster($evm.root['dialog_param_cluster'])
$evm.log("info", "<VLANS>Cluster is #{cluster}")
evm_cluster = $evm.vmdb('ems_cluster').find_by_name(cluster)

hostlist = evm_cluster.hosts
hostlist.each do |h|
h.switches.each do |s|
s.lans.each do |vlan|

vlan_name = vlan['name']
vlan_id = vlan['id']
vlan_hash["#{vlan_name}"] = vlan_name
end
end
end

dialog_field['values'] = vlan_hash
end

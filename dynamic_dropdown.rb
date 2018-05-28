dialog_field = $evm.object
dialog_field["sort_by"] = "value"
dialog_field["data_type"] = "string"
dialog_field["default_value"] = 2

$evm.vmdb(:ems_cluster).all[0].attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Lans - #{k}: #{v}")}

values = {}
$evm.vmdb(:ems_cluster).all[0].attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Lans - #{k}: #{v}")}
$evm.vmdb(:ems_cluster).all.each {
  |network| values[network.name] = network.name
}

dialog_field["values"] = values
exit MIQ_OK

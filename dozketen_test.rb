require 'fog/vcloud_director'

service = Fog::Compute::VcloudDirector.new(
  :vcloud_director_username      => "redhat@redhat",
  :vcloud_director_password      => "WeeXi9Ooh)eijue",
  :vcloud_director_host          => '10.12.0.18',
  :vcloud_director_show_progress => false,
  :vcloud_director_api_version   => '5.5',
  :connection_options            => {
    :ssl_verify_peer => false
  }
)

instantiate_options = {
  :stack_name=>"test",
  :template=>"vappTemplate-baa48227-6b7d-4187-8fd8-983225b2d255",
  :deploy=>true,
  :powerOn=>true,
  :vdc_id=>"c980b742-da8f-44db-8e5e-03709116e723",
  :source_vms=>[
    {
      :vm_id=>"vm-bb766f28-d5cd-4b89-b28b-a079e0ce9a6a",
      :networks=>[{:networkName=>"none", :IpAddressAllocationMode=>"DHCP", :IpAddress=>nil, :IsConnected=>true}],
      :hardware=>{:cpu=>{:num_cores=>1, :cores_per_socket=>1},
                  :memory=>{:quantity_mb=>4096},
                  :disk=>[{:id=>"2000", :capacity_mb=>0}]},
      :guest_customization=>{
        :Enabled=>false,
        :ComputerName=>"testest",
        :AdminPasswordEnabled=>true,
        :AdminPasswordAuto=>true,
        :ResetPasswordRequired=>false
      },
      :name=>"testest"
    }
  ],
  :vapp_networks=>[]
}

service.instantiate_template(instantiate_options)

require 'fog/vcloud_director/generators/compute/compose_common'

module Fog
  module Generators
    module Compute
      module VcloudDirector
        # @see http://pubs.vmware.com/vcd-51/topic/com.vmware.vcloud.api.reference.doc_51/doc/types/VAppType.html
        class InstantiateVappTemplateParams
          attr_reader :options
          
          include ComposeCommon
        
          def generate_xml(api_version)
            res = Nokogiri::XML::Builder.new do |xml|

              
              xml.InstantiateVAppTemplateParams((vapp_attrs)) {
                build_vapp_instantiation_params(xml)
                build_source_template(xml)
                if version_at_least?('5.6', api_version)
                  build_source_items(xml)
                else
                  build_source_items_legacy(xml)
                end
              }
            end.to_xml

            res

          end

          def version_at_least?(target_version, actual_version)
            Gem::Version.new(target_version) <= Gem::Version.new(actual_version)
          end
        end
      end
    end
  end
end

module Fog
  module VcloudDirector
    class Compute
      class Real
        # Delete the specified key and its value from catalog item metadata.
        #
        # @param [String] id Object identifier of the catalog item.
        # @param [String] key Key of the metadata item.
        # @return [Excon::Response]
        #   * body<~Hash>:
        #
        # @see http://pubs.vmware.com/vcd-51/topic/com.vmware.vcloud.api.reference.doc_51/doc/operations/DELETE-CatalogItemMetadataItem-metadata.html
        # @since vCloud API version 1.5
        def delete_catalog_item_metadata_item_metadata(id, key)
          request(
            :expects => 202,
            :method  => 'DELETE',
            :parser  => Fog::ToHashDocument.new,
            :path    => "catalogItem/#{id}/metadata/#{URI.escape(key)}"
          )
        end
      end
    end
  end
end

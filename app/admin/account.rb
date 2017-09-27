ActiveAdmin.register Account do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params :account_number, :user_id, :balance, :bitcoin_address, :slug
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
def display_name
  self.email
end
controller do
       def find_resource
         scoped_collection.friendly.find(params[:id])
       end
     end

end

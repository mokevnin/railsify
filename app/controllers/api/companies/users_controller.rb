class Api::Companies::UsersController < Api::Companies::ApplicationController
  def autocomplete
    q = {first_name_cont: params[:term]}
    scope = User.without_company_teachers(resource_company).ransack(q)
    @users = scope.result(distinct: true).limit(15).decorate

    respond_with @users, root: false, each_serializer: UserAutocompleteSerializer
  end
end

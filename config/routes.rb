Rails.application.class.routes.draw do
  match "search" => "search#index", :as => :search
end

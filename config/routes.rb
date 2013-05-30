LittleWar::Application.routes.draw do
  get "carpet/show"
  get "carpet/fight"

  root "home#index"
end

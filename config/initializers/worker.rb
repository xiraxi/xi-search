
if Rails.application.class.name == "XiSearchWorker::Application"
  XiSearchWorker::Application.config.secret_token = 'ab3f5b2749315455a002030ed2a55aa5e5a5a8293937cbfe3d70ab1aeb501d94368d2f7ae782d0ae92f283b57069f6d46b5e1174cd0813eb2c024694d07cc0b5'
  XiSearchWorker::Application.config.session_store :cookie_store, :key => '_xi_search_worker_session'
end

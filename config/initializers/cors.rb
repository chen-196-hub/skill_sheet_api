Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:8090" # React側はポート番号8090で作るので「localhost:8090」を指定

    resource "*",
      headers: :any,
      expose: ["access-token", "expiry", "token-type", "uid", "client"], # 追記
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
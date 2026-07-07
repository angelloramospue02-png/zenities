--@type Config
local config = {}
config.address = "127.0.0.1:6600"
config.mpris = true

-- Notificaciones de escritorio al cambiar de canción (opcional, pero copado)
rmpcd.install("#builtin.notify")

-- Contador de reproducciones (opcional)
rmpcd.install("#builtin.playcount")
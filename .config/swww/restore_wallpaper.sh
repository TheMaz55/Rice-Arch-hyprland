#!/bin/bash

WALL_FILE="$HOME/.config/swww/last_wallpaper"

# Attendre que le daemon soit prêt
until swww query >/dev/null 2>&1; do
  sleep 0.1
done

# Restaurer le dernier wallpaper s'il existe
if [[ -f "$WALL_FILE" ]]; then
  WALL=$(cat "$WALL_FILE")
  if [[ -f "$WALL" ]]; then
    swww img "$WALL" \
      --transition-type fade \
      --transition-duration 0.8
  fi
fi
#!/bin/bash

WAL_CACHE="$HOME/.cache/wal/wal"

# attendre que swww soit prêt
until swww query >/dev/null 2>&1; do
  sleep 0.1
done

# si walset a un wallpaper enregistré
if [[ -f "$WAL_CACHE" ]]; then
  WALL=$(cat "$WAL_CACHE")

  if [[ -f "$WALL" ]]; then
    swww img "$WALL" \
      --transition-type fade \
      --transition-duration 0.8
  fi
fi

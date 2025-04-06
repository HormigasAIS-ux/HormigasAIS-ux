alias git-rebase-hormiga='
function _git_rebase_hormiga() {
  echo ">>> Cambiando a rama hormigasaisa.atlassian.net..."
  git checkout hormigasaisa.atlassian.net || { echo "Error: Rama no encontrada."; return 1; }

  echo ">>> Iniciando rebase sobre main..."
  git fetch origin main
  git rebase origin/main || {
    echo ">>> Hay conflictos. Resuélvelos y ejecuta: git rebase --continue";
    return 1;
  }

  echo ">>> Rebase exitoso. Haciendo push forzado..."
  git push origin hormigasaisa.atlassian.net --force
  echo ">>> ¡Listo! La rama ha sido alineada con main."
}
_git_rebase_hormiga
'

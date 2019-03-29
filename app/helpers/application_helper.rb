module ApplicationHelper
end


def title(title_content)
  if title_content.present? # si le paramètre title_content est présent
    title_content << " | Doggui" # le title reprendra la chaîne en paramètre suivie de " | Mon Site"
  else
    "Doggui : spécialisé pour la saillie canine - Trouver un étalon mâle LOF" # sinon, par défaut, le title sera "Mon site"
  end
end
